from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from django.views import View
from .forms import UploadFileForm
from django.core import serializers
from .models import UploadFileModel
from .process import *
# Imaginary function to handle an uploaded file.




class UploadFileView(View):
    template_name = 'spreadsheet/index.html'
    system_name = 'SpreadSheet System'

    def get(self, request, *args, **kwargs):
        form = UploadFileForm(request.POST or None, request.FILES or None)
        context = {"form": form, "system_name": self.system_name}
        if request.is_ajax():
            table = list(UploadFileModel.objects.values())
            context = {"table": table}
            return JsonResponse(context, safe=False)

        return render(request, self.template_name, context)


    def post(self, request, *args, **kwargs):
        form = UploadFileForm(request.POST or None, request.FILES or None)
        data = {}
        if request.is_ajax():
            if form.is_valid():
                form.save()
                data['title'] = form.cleaned_data.get('title')
                data['description'] = form.cleaned_data.get('description')
                data['status'] = {"file" : ['Successfully Saved']}
                data['message'] = "success"
                latest_id = UploadFileModel.objects.last()
                latest_data = UploadFileModel.objects.get(id=int(str(latest_id)))
                latest_file = latest_data.file
                print(convertTocsv(latest_file))
                return JsonResponse(data, safe=False)
        data['status'] = form.errors
        data['message'] = "warning"
        return JsonResponse(data, safe=False)




