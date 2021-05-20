from django.conf.urls import url
from . import views
from django.views import View

urlpatterns = [
    url(r'^$', views.manager.as_view(), name="manager_enrollment"),
]