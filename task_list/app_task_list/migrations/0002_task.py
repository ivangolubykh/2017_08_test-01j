# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-25 15:59
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_task_list', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Task',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('datetime_create', models.DateTimeField(auto_now_add=True, db_index=True, help_text='Дата и время создания задачи данных', verbose_name='Дата и время создания задачи данных')),
                ('datetime_update', models.DateTimeField(auto_now=True, db_index=True, help_text='Дата и время последнего сохранения/изменения задачи', verbose_name='Дата и время последнего сохранения/изменения задачи')),
                ('name', models.CharField(db_index=True, help_text='Название задачи', max_length=200, verbose_name='Название задачи')),
                ('text', models.TextField(blank=True, help_text='Текстовое описание погоды, например: Солнечно', max_length=100, verbose_name='Текстовое описание погоды, например: Солнечно')),
            ],
        ),
    ]
