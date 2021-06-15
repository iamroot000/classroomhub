from django.db import models
from django.utils.timezone import now

class application(models.Model):
	firstname = models.TextField(max_length=20, null=False)
	middlename = models.TextField(max_length=20, null=False)
	lastname = models.TextField(max_length=20, null=False)
	ext_name = models.TextField(max_length=10, null=True)
	email = models.TextField(max_length=50, null=True)
	reg_date = models.DateTimeField(default=now)
	gradelevel = models.TextField(max_length=15, null=False)
	studenttype = models.TextField(max_length=15, null=False)
	gender = models.TextField(max_length=15, null=False)
	dateofbirth = models.DateField(null=False)
	placeofbirth = models.TextField(max_length=30, null=False)
	province = models.TextField(max_length=15, null=False)
	mobilenumber = models.BigIntegerField(null=False)
	telephonenumber = models.BigIntegerField(null=True)
	nationality = models.TextField(max_length=15, null=False)
	religion = models.TextField(max_length=15, null=False)
	address = models.TextField(max_length=50, null=False)
	barangay = models.TextField(max_length=15, null=False)
	city = models.TextField(max_length=15, null=False)
	lrn_id = models.IntegerField(null=True)
	esc_id = models.IntegerField(null=True)
	qvr_id = models.IntegerField(null=True)
	status_finance = models.TextField(max_length=15, null=False, default='pending')
	status_guidance = models.TextField(max_length=15, null=False, default='pending')
	status_registrar = models.TextField(max_length=15, null=False, default='pending')

	def __str__(self):
		return self.lastname