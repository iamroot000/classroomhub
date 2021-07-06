from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from django.views import View
from .forms import UploadFileForm
from grading_management.models import *
# from .tasks import servertasks
from .process import *
from django.contrib.auth.models import Permission, Group
# from classroom.mixins import PermissionCheckMIXIN

from django.core import serializers

# Imaginary function to handle an uploaded file.




# class UploadFileView(PermissionCheckMIXIN,View):
class UploadFileView(View):
    # permission_required = 'can_use_SPREADSHEET'
    template_name = 'spreadsheet/index.html'
    system_name = 'SpreadSheet System'

    def get(self, request, *args, **kwargs):
        form = UploadFileForm(request.POST or None, request.FILES or None)
        context = {"form": form, "system_name": self.system_name}
        if request.is_ajax():
            # print("this is celery output: ",servertasks())
            table = list(UploadFileModel.objects.values())
            context = {"table": table}
            return JsonResponse(context, safe=False)
        return render(request, self.template_name, context)


    def post(self, request, *args, **kwargs):
        form = UploadFileForm(request.POST or None, request.FILES or None)
        data = {}
        rval = {
            "data": [],
            "key": []
        }
        field_data = getstudentfield()
        if request.is_ajax():
            if form.is_valid():
                form.save()
                convertion_data = convertTocsv(getlatestrow(file=True), myval=True, save=False)
                data_convertion = convertTocsv(getlatestrow(file=True), save=True) #save data
                print(form.cleaned_data)
                data['title'] = form.cleaned_data.get('title')
                data['description'] = form.cleaned_data.get('description')
                data['studenthead'] = field_data
                data['studentdata'] = getstudentdata()
                data['lastvalue'] = list(UploadFileModel.objects.values())
                if not data_convertion:
                    file_path = os.path.join(settings.MEDIA_ROOT, str(getlatestrow(file=True)))
                    os.system("rm -f {}".format(file_path))
                    getlatestrow().delete()
                    data['converteddata'] = convertion_data
                    data['status'] = {"file": ['Invalid Data Format']}
                    data['message'] = "danger"
                else:
                    data['converteddata'] = convertion_data
                    data['status'] = {"file" : ['Succesfully Saved']}
                    data['message'] = "success"

                return JsonResponse(data, safe=False)
        data['converteddata'] = rval
        data['status'] = form.errors
        data['message'] = "warning"
        return JsonResponse(data, safe=False)


class ConfirmFileView(View):
    def get(self, request, *args, **kwargs):
        return None


    def post(self, request, *args, **kwargs):
        testing = request.POST
        data = {"testing": testing}

        return JsonResponse(data, safe=False)



