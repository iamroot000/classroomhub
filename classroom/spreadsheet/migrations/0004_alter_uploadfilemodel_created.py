# Generated by Django 3.2 on 2021-06-29 11:17

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('spreadsheet', '0003_rename_desciption_uploadfilemodel_description'),
    ]

    operations = [
        migrations.AlterField(
            model_name='uploadfilemodel',
            name='created',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]
