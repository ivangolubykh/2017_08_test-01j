from django.db import models
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    pass


class Task(models.Model):
    datetime_create = models.DateTimeField(
        # Время внесения изменений
        # auto_now_add = True сделает так, что значение поля будет
        # автоматически установлено в текущую дату при создании (первом
        # сохранении) объекта.
        auto_now_add=True,
        # Строить ли индекс по этому полю:
        db_index=True,
        help_text='Дата и время создания задачи данных',
        verbose_name='Дата и время создания задачи данных',
    )

    datetime_update = models.DateTimeField(
        # Время внесения изменений
        # auto_now = True сделает так, чтобы значение поля автоматически
        # устанавливалось в текущую дату и время при каждом сохранении объекта.
        auto_now=True,
        # Строить ли индекс по этому полю:
        db_index=True,
        help_text='Дата и время последнего сохранения/изменения задачи',
        verbose_name="Дата и время последнего сохранения/изменения задачи",
    )

    name = models.CharField(
        max_length=200,
        # При blank=True поле может быть пустым (т.е. оно необязательное):
        blank=False,
        # Если строковое поле содержит null=True, это означает, что оно может
        # содержать два возможных “пустых” значения: NULL и пустую строку.
        # Иначе - только пустую строку.
        null=False,
        # Строить ли индекс по этому полю:
        db_index=True,
        # При unique=True значение поля должно быть уникальным.
        unique=False,
        help_text='Название задачи',
        verbose_name='Название задачи',
        )

    text = models.TextField(
        max_length=100,
        # При blank=True поле может быть пустым (т.е. оно необязательное):
        blank=True,
        # Если строковое поле содержит null=True, это означает, что оно может
        #  содержать два возможных “пустых” значения: NULL и пустую строку.
        # Иначе - только пустую строку.
        null=False,
        # Строить ли индекс по этому полю:
        db_index=False,
        # При unique=True значение поля должно быть уникальным.
        unique=False,
        help_text='Текстовое описание задачи',
        verbose_name='Текстовое описание задачи',
        )

    def __str__(self):
        return self.text
