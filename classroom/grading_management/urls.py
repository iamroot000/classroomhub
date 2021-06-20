from django.conf.urls import url
from . import views
from django.views import View

urlpatterns = [
    url(r'^$', views.index.as_view(), name="grading_management"),
    url(r'^table-view', views.tableView.as_view(), name="table-view"),
]