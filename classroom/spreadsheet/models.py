from django.db import models
from django.utils import timezone
import datetime

class UploadFileModel(models.Model):
    username = models.CharField(max_length=100, null=True)
    title = models.CharField(max_length=100, null=True)
    description = models.TextField(null=True)
    file = models.FileField(upload_to='files/')
    created = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = u"UploadFile Permissions"
        verbose_name_plural = verbose_name
        # unique_together = ('title', 'file')

    def __str__(self):
        return str(self.pk)



class DownloadHistoryModel(models.Model):
    username = models.CharField(max_length=100, null=True)
    status = models.CharField(max_length=100, null=True)
    file = models.CharField(max_length=100, null=True)
    created = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = u"Download History"
        verbose_name_plural = verbose_name
        # unique_together = ('title', 'file')

    def __str__(self):
        return str(self.username)
