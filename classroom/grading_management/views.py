from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.views import View
from .models import *
from django.core import serializers

# Create your views here.
class index(View):
	def get(self, request):
		template_name = 'grading_management/index.html'
		teacher_details = teachers.objects.all()
		preschool_details = preschool_grading.objects.all()
		# print(preschool_details)
		context = {
			'teacher_details': teacher_details,
			'preschool_details': preschool_details
		}
		return render(request, template_name, context)

class tableView(View):
	def get(self,request):
		std_query = students.objects.all()
		data = serializers.serialize('json', std_query)
		print(data)
		return JsonResponse({'data':data }, safe=False)

# def __modalWritten(request):

