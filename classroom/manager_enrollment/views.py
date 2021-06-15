from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.views import View
from .models import *
from django.core import serializers
from django.contrib.auth.models import User, Group
from classroom.celery import app
# Create your views here.

class manager(View):
	template_name = 'manager_enrollment/index.html'
	def get(self, request):
		return render(request, self.template_name)

# def index(request):
# 	template_name = 'manager_enrollment/index.html'
# 	applicants_query = application.objects.filter(status='pending')
# 	context = {
# 		"applicant_list" : applicants_query,
# 	}
# 	return render(request,template_name, context)

class tableView(View):
	def get(self, request):
		applicants_query = application.objects.all()
		data = serializers.serialize('json', applicants_query)
		return JsonResponse({'data': data}, safe=False)


def __statusapproved(request):
	try:
		if request.is_ajax and request.method == "POST":
			user = request.user
			get_id = request.POST['id']
			if user.groups.filter(name='finance_group').exists():	
				to_update = application.objects.get(id=get_id)
				to_update.status_finance='approved'
				to_update.save()
			elif user.groups.filter(name='guidance_group').exists():
				to_update = application.objects.get(id=get_id)
				to_update.status_guidance='approved'
				to_update.save()
			elif user.groups.filter(name='registrar_group').exists():
				to_update = application.objects.get(id=get_id)
				to_update.status_registrar='approved'
				to_update.save()
			return HttpResponse('Approved')
	except Exception as e:
		print(e)

def __statusdeclined(request):
	try:
		if request.is_ajax and request.method == "POST":
			print('hoy')
			user = request.user
			get_id = request.POST['id']
			if user.groups.filter(name='finance_group').exists():	
				to_update = application.objects.get(id=get_id)
				to_update.status_finance='declined'
				to_update.save()
			elif user.groups.filter(name='guidance_group').exists():
				to_update = application.objects.get(id=get_id)
				to_update.status_guidance='declined'
				to_update.save()
			elif user.groups.filter(name='registrar_group').exists():
				to_update = application.objects.get(id=get_id)
				to_update.status_registrar='declined'
				to_update.save()
			return HttpResponse('Declined')
	except Exception as e:
		print(e)

class detailsView(View):
	def get(self, request):
		wq = application.objects.all()
		data = serializers.serialize('json',wq)
		return JsonResponse({'data': data}, safe=False)


def __test_cece(request):
	print('testtest')
	try:
		if request.is_ajax() and request.method=='POST':
			rcache = app.send_task('test.testing', args=['nik'], kwargs={})
			print(rcache.get())
			return HttpResponse(rcache.get())
	except Exception as e:
		print(e)


