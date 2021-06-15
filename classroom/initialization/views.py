from django.shortcuts import render, redirect
from django.views import View
from .models import *
import datetime
from datetime import timedelta
import logging, os

# Create your views here.
class index(View):
	template_name = 'index.html'
	def get(self, request):
		return render(request, self.template_name)