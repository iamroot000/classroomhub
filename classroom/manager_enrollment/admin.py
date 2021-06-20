from django.contrib import admin
from .models import *

# Register your models here.
class applicationAdmin(admin.ModelAdmin):
	readonly_fields =('id',)

admin.site.register(application,applicationAdmin)
admin.site.register(enrolled_students)