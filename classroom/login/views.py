from django.shortcuts import render
from django.views import View
# Create your views here.

class home(View):

	template_name = 'index.html'

	def get(self, request):
		
		return render(request, self.template_name)



# class login(View):
	
# 	template_name =
		