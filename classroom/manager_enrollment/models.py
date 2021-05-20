from django.db import models
from django.utils.timezone import now

# Create your models here.
class alumni(models.Model):	
	enrollment_id = models.IntegerField(max_length=9, null=True)
	aluminfo = models.TextField(max_length=250, null=False)
	alumsurvey = models.TextField(max_length=250, null=False)

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
	mobilenumber = models.BigIntegerField(max_length=20, null=False)
	telephonenumber = models.BigIntegerField(max_length=20, null=True)
	nationality = models.TextField(max_length=15, null=False)
	religion = models.TextField(max_length=15, null=False)
	address = models.TextField(max_length=50, null=False)
	barangay = models.TextField(max_length=15, null=False)
	city = models.TextField(max_length=15, null=False)
	status = models.TextField(max_length=15, null=False, default='pending')

	def __str__(self):
		return self.lastname
class test(models.Model):
	testfield = models.TextField(max_length=10)

class educbackground(models.Model):
	enrollment_id = models.IntegerField(max_length=9, null=True)
	preschool = models.TextField(max_length=250, null=True)
	gradeschool = models.TextField(max_length=250, null=True)
	highschool = models.TextField(max_length=250, null=True)


class fambackground(models.Model):
	enrollment_id = models.IntegerField(max_length=9, null=True)
	motherinfo = models.TextField(max_length=250, null=True)
	fatherinfo = models.TextField(max_length=250, null=True)
	siblingsinfo = models.TextField(max_length=250, null=True)
	otherfaminfo = models.TextField(max_length=250, null=True)

class governmentid(models.Model):
	enrollment_id = models.IntegerField(max_length=9, null=True)
	lrn_id = models.IntegerField(max_length=15, null=False)
	esc_id = models.IntegerField(max_length=15, null=False)
	qvr_id = models.IntegerField(max_length=15, null=False)

	def __str__(self):
		return self.enrollment_id

class health(models.Model):
	enrollment_id = models.IntegerField(max_length=9, null=True)
	healthsurvey = models.TextField(max_length=250, null=True)


class schoolsurvey(models.Model):
	enrollment_id = models.IntegerField(max_length=9, null=True)
	surveyinfo = models.TextField(max_length=250, null=True)



