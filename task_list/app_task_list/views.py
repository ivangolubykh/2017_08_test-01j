from django.shortcuts import render, render_to_response
from django.http import JsonResponse
from django.template.base import Template
from django.http.response import HttpResponse
from django.template.context import Context
from django.middleware import csrf
from django.http import Http404
import json


def main_page(request):
    return render_to_response("index.html")


def get_csrf(request):
    t = Template("{{csrf_token_value}}")
    resp = t.render(Context({'csrf_token_value': csrf.get_token(request)}))
    return HttpResponse(resp)


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


def add_data_json(request):
    if request.method == "POST" \
            and request.content_type == 'application/json':
        data_dict = json.loads(request.body.decode())

        return render_to_response("index.html")
    else:
        raise Http404("Not POST or no data.")
