from django.conf.urls import url
from . import views
from django.views import View

urlpatterns = [
    url(r'^$', views.manager.as_view(), name="manager_enrollment"),
    url(r'^approved', views.__statusapproved, name="approved_status"),
    url(r'^declined', views.__statusdeclined, name="declined_status"),
    # url(r'^celery', views.__test_cece, name="test_celery"),
    url(r'^table-view', views.tableView.as_view(), name='table-view'),
    url(r'^modal-view', views.detailsView.as_view(), name='modal-view'),
]