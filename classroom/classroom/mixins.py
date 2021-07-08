from django.contrib.auth.mixins import AccessMixin
from django.http import Http404, HttpResponseNotFound


class PermissionCheckMIXIN(AccessMixin):
    permission_required = None
    appname = None
    def dispatch(self, request, *args, **kwargs):
        if not request.user.has_perm(self.appname+'.'+ self.permission_required):
            self.raise_exception = True
            return self.handle_no_permission()
            # raise Http404

        return super(PermissionCheckMIXIN, self).dispatch(request, *args, **kwargs)

