from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.views import View
from .models import *
from django.core import serializers
from itertools import chain
import json
import collections
from .process.transm_calc import calculateme

# Create your views here.
class index(View):
	def get(self, request):
		template_name = 'grading_management/index.html'
		preschool_details = preschool_grading.objects.all()
		teacher_details = teachers.objects.all()

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
			print(total_rWW)
			get_ww_multi = teachers.objects.all().values('ww_multip')
			for ww_multi in get_ww_multi:
				www = ww_multi['ww_multip']
				dwwt = json.loads(www)
				wwwt = dwwt['math']
			# print(wwwt)

			to_update_ww = students.objects.get(id=get_id)
			nwwwt = wwwt / to_update_ww.total_items_ww
			total_rWW = sum(newlist) * nwwwt
			print(total_rWW)
			to_update_ww.raw_written_work = get_rWW
			to_update_ww.written_work_grade = total_rWW
			to_update_ww.save()
			to_update_ww.initial_grade =  total_rWW + to_update_ww.performance_task_grade
			to_update_ww.save()
			to_update_ww.transm_grade = calculateme(to_update_ww.initial_grade)
			to_update_ww.save()
			return HttpResponse('Successfully Added!')
	except Exception as e:
		print(e)

def __saveRPT(request):
	try:
		if request.is_ajax and request.method == "POST":
			counter = 0;
			newdick = {};
			int_res_list = [];
			cgrade_pt = [];
			newlist = [];
			get_id = request.POST.get('id')
			get_rPT = request.POST.getlist('pt[]')
			for i in get_rPT:
				counter += 1;
				new_rPT = i[9:-1]
				to_lrPT = new_rPT.split(':')
				res_dct = {to_lrPT[i]: to_lrPT[i + 1] for i in range(0, len(to_lrPT), 2)}
				newlist.append(res_dct)
			for x in newlist:
				for xkey in x:
					x[xkey] = int(x[xkey])
			to_update_sraw_pt = students.objects.get(id=get_id)
			to_update_sraw_pt.sraw_performance_task = newlist
			to_update_sraw_pt.save()
			counter = collections.Counter()
			for d in newlist:
				counter.update(d)
			cgrade_pt.append(dict(counter))
			valuesz = dict(counter).values()
			total_pt = sum(valuesz)
			cgrade_pt.append(total_pt)
			print(cgrade_pt)
			get_pt_multi = teachers.objects.all().values('pt_multip')
			for pt_multi in get_pt_multi:
			# print(pt_multi['pt_multip'])
				ppt = pt_multi['pt_multip']
				dppt = json.loads(ppt)
				pppt = dppt['math']
			npppt = pppt / to_update_sraw_pt.total_items_pt
			total_rPT = npppt * total_pt
			to_update_sraw_pt.performance_task_grade = total_rPT
			to_update_sraw_pt.save()
			to_update_sraw_pt.initial_grade = total_rPT + to_update_sraw_pt.written_work_grade
			to_update_sraw_pt.save()
			to_update_sraw_pt.transm_grade = calculateme(to_update_sraw_pt.initial_grade)
			to_update_sraw_pt.save()
			return HttpResponse('Successfully Added!')
	except Exception as e:
		print(e)

class viewWrittenWork(View):
	def get(self, request):
		ww_q = students.objects.all()
		data = serializers.serialize('json', ww_q)
		return JsonResponse({'data': data}, safe=False)

class subject_manager(View):
	def get(self, request):
		template_name = 'grading_management/index_subject_manager.html'
		teacher_details = teachers.objects.all()
		context = {
			'teacher_details': teacher_details,
		}
		return render(request, template_name, context)

