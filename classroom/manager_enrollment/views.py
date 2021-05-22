from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.views import View
from .models import *
from django.core import serializers
# Create your views here.

# class manager(View):

# 	template_name = 'manager_enrollment/index.html'

# 	def get(self, request):
# 		applicants_query = application.objects.filter(status='pending')
# 		governmentid_query = governmentid.objects.all()
# 		context = {
# 			"applicant_list" : applicants_query,
# 			"governmentid_list"	: governmentid_query
# 		}
# 		return render(request, self.template_name, context)

def index(request):
	template_name = 'manager_enrollment/index.html'
	applicants_query = application.objects.filter(status='pending')
	context = {
		"applicant_list" : applicants_query,
	}
	return render(request,template_name, context)


def __statusapproved(request):
	try:
		if request.method == "POST":
			get_id = request.POST["get_id"]
			to_update = application.objects.get(id=get_id)
			print(to_update)
			to_update.status='approved'
			to_update.save()
			return HttpResponse('')
	except Exception as e:
		print(e)


def __statusdeclined(request):
	try:
		if request.method == "POST":
			get_id = request.POST["get_id"]
			to_update = application.objects.get(id=get_id)
			print(to_update)
			to_update.status='declined'
			to_update.save()
			return HttpResponse('')
	except Exception as e:
		print(e)
	# return redirect(index)

class detailsView(View):
	def get(self, request):
		wq = application.objects.filter(status='pending')
		data = serializers.serialize('json',wq)
		return JsonResponse({'data': data}, safe=False)

