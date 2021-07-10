# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render
from django.views import View
from argus.mixins import GENERIC_PERMISSION_MIXIN
from django.http import HttpResponse
from argus.celery import app
import json
import re
import datetime
import pytz

from inventory.models import HOSTS,COUNTRY_CODES
from esync.models import INITIALIZATION_TYPES,SERVICE_PROVIDERS,INITIALIZED_SERVERS
from django.db.models import F

from django.conf import settings
from pprint import pprint
from esync.lib.initializer import HostBuilder
from argus.log import log


HOSTNAME_REGEX = r'(\S+)-([a-zA-Z_]+[a-zA-Z_0-9]+[a-zA-Z_]+)(\d+)\.(\S+)\.(\S+)\.(monaco1\.me)'
CELERY_HOSTNAME = 'ansible-207-initializer'

PERMISSION_REQUIRED = 'can_esync_initialize'


class index(GENERIC_PERMISSION_MIXIN, View):
    permission_required = PERMISSION_REQUIRED
    template_name = 'esync/initializer.html'


    def date_serializer(self, obj):
        if isinstance(obj, datetime.datetime) or isinstance(obj, datetime.date):
            return obj.astimezone(pytz.timezone('Singapore')).strftime("%Y-%m-%d %H:%M:%S")


    def __setStatus(self,logFile):
        cel = app.send_task('{0}.getLogStatus'.format(CELERY_HOSTNAME),
                            args=(logFile,),
                            queue='{0}-q'.format(CELERY_HOSTNAME))
        data = cel.get()
        cel.forget()

        if data == True:
            obj = INITIALIZED_SERVERS.objects.get(logfile=logFile)
            obj.initialization_status = 'COMPLETED'
            obj.enabled = True
            obj.save()

        elif data == False:
            obj = INITIALIZED_SERVERS.objects.get(logfile=logFile)
            obj.initialization_status = 'ERROR_FAILED'
            obj.enabled = False
            obj.save()

        return data

    def get(self, request):
        context = {}
        q = request.GET.get("q", None)
        if q == 'getConfig':
            context = {
                'business_units':[],
                'server_functions':[],
                'initialization_types':list(INITIALIZATION_TYPES.objects.filter().values('initialization_type','initialization_name')),
                'service_providers':list(SERVICE_PROVIDERS.objects.filter().values('service_provider','service_provider_prefix')),
                'country_codes':list(COUNTRY_CODES.objects.filter().values('country_code','location'))
            }
            objects = list(HOSTS.objects.filter().values('hostname'))

            for row in objects:
                match = re.match(HOSTNAME_REGEX,
                                 row['hostname'])

                if match:
                    if match.group(1) not in context['business_units']:
                        context['business_units'].append(match.group(1).lower())
                    if match.group(2) not in context['server_functions']:
                        context['server_functions'].append(match.group(2).lower())

            return HttpResponse(json.dumps(context), content_type='application/json')
        elif q == 'getLogs':
            offset = request.GET.get("o", None)
            logFile = request.GET.get("log",None)
            if offset and logFile:

                cel = app.send_task('{0}.streamLogs'.format(CELERY_HOSTNAME),
                                    args=(logFile,),
                                    kwargs={
                                        'start': int(offset)
                                    },
                                    queue='{0}-q'.format(CELERY_HOSTNAME))
                data = cel.get()
                cel.forget()
                context['log'] = data
                self.__setStatus(logFile)
                return HttpResponse(json.dumps(context), content_type='application/json')
            elif logFile and not offset:
                self.template_name='esync/initiald_logs.html'

        elif q == 'getLogStatus':
            logFile = request.GET.get("log",None)
            if logFile:
                context['status'] = self.__setStatus(logFile)
                return HttpResponse(json.dumps(context), content_type='application/json')

        elif q == 'getInitList':
            context['initialized_servers'] =list(INITIALIZED_SERVERS.objects.filter().values('hosts_id__hostname','hosts_id__host_ip','initialization_status','logfile','initialization_type__initialization_name','service_provider','created'))
            return HttpResponse(json.dumps(context, default=self.date_serializer), content_type='application/json')

        return render(request, self.template_name, context)

class start_init(GENERIC_PERMISSION_MIXIN, View):
    permission_required = PERMISSION_REQUIRED

    def __verifyRequestBody(self,body):
        errs = []
        isSuccessful =True
        for i in body:
            body[i]=body[i].strip()
        spObj = SERVICE_PROVIDERS.objects.filter(service_provider_prefix=body['service_provider']).values('service_provider_prefix')
        ccObj = COUNTRY_CODES.objects.filter(country_code=body['country_code']).values('country_code')
        if not spObj:
            errs.append('Invalid Service Provider')
        if not ccObj:
            errs.append('Invalid Country Code')
        if not body['ip_address'] or not re.match(r'\b(?:\d{1,3}\.){3}\d{1,3}\b',body['ip_address']):
            errs.append('Invalid IP Address')
        if INITIALIZED_SERVERS.objects.filter(hosts_id__host_ip=body['ip_address']) or HOSTS.objects.filter(host_ip=body['ip_address']):
            errs.append("Host Exists")
        if not body['root_password']:
            errs.append('Root Password Missing')
        if not body['server_function'] or not re.match(r'([a-zA-Z_]+[a-zA-Z_0-9]+[a-zA-Z_]+)$',body['server_function']):
            errs.append('Invalid Server Function, should be ([a-zA-Z_])')
        hostname = '{0}-{1}'.format(body['business_unit'],body['server_function'])
        if not re.match(r'(\S+)-([a-zA-Z_]+[a-zA-Z_0-9]+[a-zA-Z_]+)',hostname):
            errs.append('Invalid Host Values')
        itObj = INITIALIZATION_TYPES.objects.filter(initialization_type=body['initialization_type']).values('initialization_type')
        if not itObj:
            errs.append("Invalid initialization type")
        if errs:
            isSuccessful = False
        return isSuccessful,errs

    def __send_task(self,syncParams):
        cel = app.send_task('{0}.start'.format(CELERY_HOSTNAME),
                            args=(
                                syncParams,
                            ),
                            queue='{0}-q'.format(CELERY_HOSTNAME))
        rVal = cel.get()
        cel.forget()
        return rVal

    def __save_obj(self,logFile,retry,obj):
        if not retry:
            obj.saveModel(logfile=logFile)

        else:
            obj.logfile = logFile
            obj.initialization_status = 'IN_PROGRESS'
            obj.created=datetime.datetime.now()
            obj.save()


    def post(self, request):
        context = {
            'is_successful':False,
            'result':None
        }
        body = json.loads(request.body)
        retry = request.GET.get("retry", None)

        if retry is None:
            verify = self.__verifyRequestBody(body)
            if verify[0]:
                HostObj = HostBuilder(body['business_unit'], body['server_function'], body['country_code'],
                                      body['service_provider'], body['ip_address'], body['initialization_type'],
                                      HOSTNAME_REGEX)
                hostname = HostObj.hostname
                initType = body['initialization_type']
                ipAddress = body['ip_address']
                password = body['root_password']
            else:
                context['result'] = verify[1]
                return HttpResponse(json.dumps(context), content_type='application/json')
        else:
            print 'RETRY'
            try:
                HostObj = INITIALIZED_SERVERS.objects.get(hosts_id__hostname=body['hostname'],
                                                          initialization_status='ERROR_FAILED')
                hostname = HostObj.hosts_id.hostname
                initType = HostObj.initialization_type.initialization_type
                ipAddress = HostObj.hosts_id.host_ip
                password = 'None'
            except:
                context['result'] = 'Cannot Reinitialize server, no error found in previous initialization result'
                return HttpResponse(json.dumps(context), content_type='application/json')


        context['result'] = self.__send_task({
                                        'IP': ipAddress,
                                        'PASSWORD': password,
                                        'HOSTNAME': hostname,
                                        'ITYPE': initType,
                                        'user': request.user.username
                                    })
        context['is_successful'] = True

        self.__save_obj(context['result'][0][2],retry,HostObj)
        log.info(HostObj)
        log.info(context)

        return HttpResponse(json.dumps(context), content_type='application/json')
