# Generated by Django 3.2 on 2021-06-19 15:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('grading_management', '0003_rename_components_preschool_grading_subject'),
    ]

    operations = [
        migrations.CreateModel(
            name='teachers',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('last_name', models.TextField(max_length=30, null=True)),
                ('subject', models.TextField(max_length=30, null=True)),
            ],
        ),
    ]
