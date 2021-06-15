# Generated by Django 3.2 on 2021-05-25 08:58

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('grading_management', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='students',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('last_name', models.TextField(max_length=30, null=True)),
                ('first_name', models.TextField(max_length=30, null=True)),
                ('q1_grade', models.IntegerField(default=0)),
                ('q2_grade', models.IntegerField(default=0)),
                ('q3_grade', models.IntegerField(default=0)),
                ('q4_grade', models.IntegerField(default=0)),
                ('total_grade', models.IntegerField(default=0)),
                ('average_grade', models.IntegerField(default=0)),
                ('subject', models.TextField(max_length=30, null=True)),
                ('section', models.TextField(max_length=30, null=True)),
            ],
        ),
    ]
