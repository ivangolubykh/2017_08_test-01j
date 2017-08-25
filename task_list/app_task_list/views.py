from django.shortcuts import render, render_to_response
from django.http import JsonResponse


def main_page(request):
    return render_to_response("index.html")


def get_data_json(request):
    data = [
        {
          'name': 'Задача 1',
          'text': 'Текст задачи 1'
        },
        {
            'name': 'Задача 2',
            'text': 'Текст задачи 2'
        },
        {
            'name': 'Задача 3',
            'text': 'Текст задачи 3'
        },
        {
            'name': 'Задача 4',
            'text': 'Текст задачи 5'
        },
    ]

    return JsonResponse({'list': data})
