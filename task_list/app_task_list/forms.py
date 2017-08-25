from django import forms
from .models import Task


class EditTaskForm(forms.ModelForm):
    class Meta:
        # Модель (БД) данных, которую используем:
        model = Task
        # Типы полей, отображаемых в форме
        fields = ('__all__')
        fields = ('name', 'text')
