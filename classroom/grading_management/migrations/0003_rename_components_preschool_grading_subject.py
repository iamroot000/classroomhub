# Generated by Django 3.2 on 2021-06-01 02:16

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('grading_management', '0002_students'),
    ]

    operations = [
        migrations.RenameField(
            model_name='preschool_grading',
            old_name='components',
            new_name='subject',
        ),
    ]
