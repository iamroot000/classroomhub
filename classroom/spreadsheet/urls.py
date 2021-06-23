from django.conf.urls import url
from .views import UploadFileView
from django.views import View
from django.conf.urls.static import static
from django.conf import settings
urlpatterns = [
   url(r'^$', UploadFileView.as_view(), name="upload-file"),
   # url(r'^upload/$', UploadedFileView.as_view(), name="uploaded-file"),
]

