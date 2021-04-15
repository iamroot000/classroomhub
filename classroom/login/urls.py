from django.conf.urls import url
from . import views
from django.views import View
from django.contrib.auth import views as auth_views

urlpatterns = [
    # url(r'^$', views.home.as_view(), name="home"),
    url(r'^$', auth_views.LoginView.as_view(template_name='index.html'), name="home"),
]