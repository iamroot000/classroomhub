# Generated by Django 3.2 on 2021-07-31 22:29

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('grading_management', '0014_auto_20210801_0628'),
    ]

    operations = [
        migrations.AlterField(
            model_name='teachers',
            name='pt_multip',
            field=models.TextField(max_length=250, null=True),
        ),
        migrations.AlterField(
            model_name='teachers',
            name='ww_multip',
            field=models.TextField(max_length=250, null=True),
        ),
    ]
