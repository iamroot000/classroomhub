# Generated by Django 3.2 on 2021-07-05 20:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('spreadsheet', '0009_alter_uploadfilemodel_unique_together'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='uploadfilemodel',
            options={'permissions': (('can_use_SPREADSHEET', 'Can view pizza'),), 'verbose_name': 'UploadFile Permissions', 'verbose_name_plural': 'UploadFile Permissions'},
        ),
    ]