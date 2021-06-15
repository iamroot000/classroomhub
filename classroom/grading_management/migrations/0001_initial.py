# Generated by Django 3.2 on 2021-05-25 08:35

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='preschool_grading',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('components', models.TextField(max_length=20, null=True)),
                ('written_work', models.IntegerField(default=0)),
                ('performance_task', models.IntegerField(default=0)),
                ('quarterly_assessment', models.IntegerField(default=0)),
            ],
        ),
    ]
