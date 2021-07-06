from django.conf.urls import url
from .views import *



urlpatterns = [
   url(r'^$', UploadFileView.as_view(), name="spreadsheet-home"),
   url(r'^confirm/$', ConfirmFileView.as_view(), name="confirm-file"),
]


