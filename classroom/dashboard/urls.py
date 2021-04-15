from django.conf.urls import url
from . import views
from django.views import View

urlpatterns = [
    url(r'^$', views.dashboard.as_view(), name="dashboard"),
]