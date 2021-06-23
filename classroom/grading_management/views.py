from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.views import View
from .models import *
from django.core import serializers
import json

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
		# print(data)
		return JsonResponse({'data':data }, safe=False)

def __saveRWW(request):
	try:
		if request.is_ajax and request.method == "POST":
			newlist = [];
			get_id = request.POST.get('id')
			get_rWW = request.POST.getlist('ww[]')
			count_rWW = len(get_rWW)
			total_rWW = 0;
			for i in get_rWW:
				newlist.append(int(i))
			print(newlist)
			total_rWW = sum(newlist)
			print(total_rWW)
			to_update_ww = students.objects.get(id=get_id)
			to_update_ww.raw_written_work = get_rWW
			to_update_ww.written_work_grade = total_rWW
			to_update_ww.save()
			return HttpResponse('Successfully Added!')
	except Exception as e:
		print(e)

class viewWrittenWork(View):
	def get(self, request):
		ww_q = students.objects.all()
		data = serializers.serialize('json', ww_q)
		return JsonResponse({'data': data}, safe=False)

