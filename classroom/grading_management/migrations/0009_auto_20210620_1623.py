# Generated by Django 3.2 on 2021-06-20 08:23

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('grading_management', '0008_auto_20210620_1317'),
    ]

    operations = [
        migrations.RenameField(
            model_name='students',
            old_name='average_grade',
            new_name='initial_grade',
        ),
        migrations.RenameField(
            model_name='students',
            old_name='total_grade',
            new_name='performance_task_grade',
        ),
        migrations.AddField(
            model_name='students',
            name='transm_grade',
            field=models.IntegerField(default=0),
        ),
        migrations.AddField(
            model_name='students',
            name='written_work_grade',
            field=models.IntegerField(default=0),
        ),
    ]