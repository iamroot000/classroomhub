from django.http import HttpResponseRedirect, JsonResponse, FileResponse
from django.shortcuts import render, get_object_or_404, HttpResponse, Http404
from django.contrib.auth.decorators import login_required
from django.views import View
from .forms import UploadFileForm
from grading_management.models import *
# from .tasks import servertasks
from .process import *
from django.contrib.auth.models import Permission, Group
from classroom.mixins import PermissionCheckMIXIN

from django.core import serializers

# Imaginary function to handle an uploaded file.




class UploadFileView(PermissionCheckMIXIN,View):
# class UploadFileView(View):
    permission_required = 'can_use_SPREADSHEET'
    appname = 'spreadsheet'

    template_name = 'spreadsheet/index.html'
    system_name = 'SpreadSheet System'

    def get(self, request, *args, **kwargs):
        form = UploadFileForm(request.POST or None, request.FILES or None)
        context = {"form": form, "system_name": self.system_name}
        if request.is_ajax():
            # print("this is celery output: ",servertasks())
            table = list(UploadFileModel.objects.values())
            context = {"table": table}
            if not request.user.has_perm(self.appname + '.' + 'can_download_SPREADSHEET'):
                context.update({'permission': False})
            else:
                context.update({'permission': True})
            print('this is the context: ', context)
            return JsonResponse(context, safe=False)
        return render(request, self.template_name, context)


    def post(self, request, *args, **kwargs):
        form = UploadFileForm(request.POST or None, request.FILES or None)
        data = {}
        rval = {
            "data": [],
            "key": []
        }
        field_data = getstudentfield()
        if request.is_ajax():
            if form.is_valid():
                form.save()
                data = {'username': str(request.user)}
                savedatainfo(upload=True, **data)
                convertion_data = convertTocsv(getlatestrow(file=True), myval=True, save=False)
                data_convertion = convertTocsv(getlatestrow(file=True), save=True) #save data
                print(form.cleaned_data)
                data['title'] = form.cleaned_data.get('title')
                data['description'] = form.cleaned_data.get('description')
                data['studenthead'] = field_data
                data['studentdata'] = getstudentdata()
                data['lastvalue'] = list(UploadFileModel.objects.values())
                if not data_convertion:
                    file_path = os.path.join(settings.MEDIA_ROOT, str(getlatestrow(file=True)))
                    os.system("rm -f {}".format(file_path))
                    getlatestrow().delete()
                    data['converteddata'] = convertion_data
                    data['status'] = {"file": ['Invalid Data Format']}
                    data['message'] = "danger"
                else:
                    data['converteddata'] = convertion_data
                    data['status'] = {"file" : ['Succesfully Saved']}
                    data['message'] = "success"

                return JsonResponse(data, safe=False)
        data['converteddata'] = rval
        data['status'] = form.errors
        data['message'] = "warning"
        return JsonResponse(data, safe=False)





class DownloadFileView(PermissionCheckMIXIN, View):
    permission_required = 'can_download_SPREADSHEET'
    appname = 'spreadsheet'
    def get(self, request, path):       
        file_path = os.path.join(settings.MEDIA_ROOT, path)
        if os.path.exists(file_path):
            with open(file_path, 'rb') as fh:
                response = HttpResponse(fh.read(), content_type="application/vnd.ms-excel")
                response['Content-Disposition'] = 'inline; filename=' + os.path.basename(file_path)
            data = {'username': str(request.user), 'status': 'DOWNLOADED', 'file': path.split('/')[-1]}
            savedatainfo(history=True, **data)
            return response
        else:
            data = {'username': str(request.user), 'status': 'MISSING', 'file': path.split('/')[-1]}
            savedatainfo(history=True, **data)
            raise Http404






class DownloadHistoryView(PermissionCheckMIXIN,View):
    permission_required = 'can_download_SPREADSHEET'
    appname = 'spreadsheet'

    template_name = 'spreadsheet/index.html'
    system_name = 'SpreadSheet System'

    def get(self, request, *args, **kwargs):
        if request.is_ajax():
            table = list(DownloadHistoryModel.objects.values())
            tablehead = getdownloadhistoryfield()
            context = {"table": table, "tablehead": tablehead}
            return JsonResponse(context, safe=False)
        raise Http404

