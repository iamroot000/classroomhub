# Generated by Django 3.2 on 2021-06-23 01:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('grading_management', '0009_auto_20210620_1623'),
    ]

    operations = [
        migrations.AddField(
            model_name='students',
            name='raw_written_work',
            field=models.TextField(max_length=150, null=True),
        ),
    ]