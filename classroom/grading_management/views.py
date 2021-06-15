from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.views import View
from .models import *
from django.core import serializers

# Create your views here.
class index(View):
	def get(self, request):
		template_name = 'grading_management/index.html'
		return render(request, template_name)

class tableView(View):
	def get(self,request):
		std_query = students.objects.all()
		data = serializers.serialize('json', std_query)
		return JsonResponse({'data':data}, safe=False)
