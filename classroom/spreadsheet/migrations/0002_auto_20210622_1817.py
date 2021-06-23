# Generated by Django 3.2 on 2021-06-22 10:17

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('spreadsheet', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='uploadfilemodel',
            old_name='upload',
            new_name='file',
        ),
        migrations.AddField(
            model_name='uploadfilemodel',
            name='created',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
        migrations.AddField(
            model_name='uploadfilemodel',
            name='desciption',
            field=models.TextField(null=True),
        ),
        migrations.AddField(
            model_name='uploadfilemodel',
            name='title',
            field=models.CharField(max_length=100, null=True),
        ),
    ]
