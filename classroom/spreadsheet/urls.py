from django.conf.urls import url
from .views import *




urlpatterns = [
   url(r'^$', UploadFileView.as_view(), name="spreadsheet-home"),
   url(r'^download/(?P<path>.*)$', DownloadFileView.as_view(), name="spreadsheet-download"),
   url(r'^history$', DownloadHistoryView.as_view(), name="spreadsheet-history"),
]


