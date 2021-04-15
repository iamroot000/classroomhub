from django.shortcuts import render
from django.views import View

# Create your views here.

class dashboard(View):

	template_name = 'dashboard.html'

	def get(self, request):
		
		return render(request, self.template_name)