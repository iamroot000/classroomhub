from django.shortcuts import render
from django.views import View
from .models import *
# Create your views here.

class manager(View):

	template_name = 'manager_enrollment/index.html'

	def get(self, request):
		applicants_query = application.objects.filter(status='pending')
		governmentid_query = governmentid.objects.all()
		context = {
			"applicant_list" : applicants_query,
			"governmentid_list"	: governmentid_query
		}
		return render(request, self.template_name, context)

	def post(self,request,value):
		return redirect(manager)