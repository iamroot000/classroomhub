from django.db import models
# class students(models.Model):
# 	last_name = TextField(max_length=30,null=True)
# 	first_name = TextField(max_length=30,null=True)

# 	def __str__(self):
# 		return self.last_name
class preschool_grading(models.Model):
	subject = models.TextField(max_length=20, null=True)
	written_work = models.IntegerField(null=False, default=0)
	performance_task = models.IntegerField(null=False, default=0)
	quarterly_assessment = models.IntegerField(null=False, default=0)
	sub_performance_task = models.TextField(max_length=250, null=True)

	def __str__(self):
		return self.subject

class students(models.Model):
	last_name = models.TextField(max_length=30,null=True)
	first_name = models.TextField(max_length=30,null=True)
	q1_grade = models.IntegerField(null=False, default=0)
	q2_grade = models.IntegerField(null=False, default=0)
	q3_grade = models.IntegerField(null=False, default=0)
	q4_grade = models.IntegerField(null=False, default=0)
	initial_grade = models.IntegerField(null=False, default=0)
	transm_grade = models.IntegerField(null=False, default=0)
	subject = models.TextField(max_length=30,null=True)
	section = models.TextField(max_length=30,null=True)
	performance_task_grade = models.IntegerField(null=False, default=0)
	written_work_grade = models.IntegerField(null=False, default=0)

	def __str__(self):
		return self.last_name

class teachers(models.Model):
	username = models.TextField(max_length=30, null=True)
	subject = models.TextField(max_length=250, null=True)
	section = models.TextField(max_length=250, null=True)


	def __str__(self):
		return self.username