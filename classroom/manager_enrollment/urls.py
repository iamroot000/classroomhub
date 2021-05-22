from django.conf.urls import url
from . import views
from django.views import View

urlpatterns = [
    url(r'^$', views.index, name="manager_enrollment"),
    url(r'^approved', views.__statusapproved, name="approved_status"),
    url(r'^declined', views.__statusdeclined, name="declined_status"),
    url(r'^json-test', views.detailsView.as_view(), name='test-json')
]