# Generated by Django 3.2 on 2021-05-20 07:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('manager_enrollment', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='application',
            name='reg_date',
            field=models.DateTimeField(auto_now_add=True, null=True),
        ),
    ]
