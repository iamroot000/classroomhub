from django.db import models
from django.utils import timezone

class UploadFileModel(models.Model):
    title = models.CharField(max_length=100, null=True)
    description = models.TextField(null=True)
    file = models.FileField(upload_to='files/')
    created = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return str(self.pk)
