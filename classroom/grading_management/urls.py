from django.conf.urls import url
from . import views
from django.views import View

urlpatterns = [
    url(r'^$', views.index.as_view(), name="grading_management"),
    url(r'^table-view', views.tableView.as_view(), name="table-view"),
    url(r'^save-raw-ww', views.__saveRWW, name="save-raw-ww"),
    url(r'^modal-ww', views.viewWrittenWork.as_view(), name="view-raw-ww"),
    url(r'^subject-manager', views.subject_manager.as_view(), name='subject-manager'),
    url(r'^save-raw-pt', views.__saveRPT, name='save-raw-pt'),
]