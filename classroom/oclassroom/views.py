from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect, HttpResponse, JsonResponse
from django.views import View
from .models import *
from django.core import serializers
from django.contrib.auth.models import User, Group


class index(View):
	template_name = 'oclassroom/index.html'
	def get(self, request):
		return render(request, self.template_name)