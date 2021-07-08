from django.contrib import admin
from django.contrib.auth.models import Permission
from django.contrib.contenttypes.models import ContentType
from .models import *


def uploadfilepermission():
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

def downloadfilepermission():
    content_type = ContentType.objects.get_for_model(UploadFileModel)
    ct_code = 'can_download_SPREADSHEET'
    try:
        Permission.objects.get(codename=ct_code)
    except Exception as e:
        permission = Permission.objects.create(
            codename=ct_code,
            name='Can Download SpreadSheet System',
            content_type=content_type,
        )


class UploadFileModelAdmin(admin.ModelAdmin):
    list_display = ['username', 'title','description','file']
    search_fields = ['username', 'title','description','file']



class DownloadHistoryModelAdmin(admin.ModelAdmin):
    list_display = ['username','status', 'file']
    search_fields = ['username','status', 'file']




uploadfilepermission()
downloadfilepermission()
admin.site.register(UploadFileModel,UploadFileModelAdmin)
admin.site.register(DownloadHistoryModel,DownloadHistoryModelAdmin)

