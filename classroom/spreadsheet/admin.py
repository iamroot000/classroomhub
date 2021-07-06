from django.contrib import admin
from django.contrib.auth.models import Permission
from django.contrib.contenttypes.models import ContentType
from .models import UploadFileModel

content_type = ContentType.objects.get_for_model(UploadFileModel)
ct_code = 'can_use_SPREADSHEET'
try:
    Permission.objects.get(codename=ct_code)
except Exception as e:
    permission = Permission.objects.create(
        codename=ct_code,
        name='Can Use SpreadSheet System',
        content_type=content_type,
    )



class UploadFileModelAdmin(admin.ModelAdmin):
    list_display = ['title','description','file']
    search_fields = ['title','description','file']


admin.site.register(UploadFileModel,UploadFileModelAdmin)


