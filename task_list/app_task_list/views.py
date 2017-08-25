from django.shortcuts import render, render_to_response
from django.http import JsonResponse
from django.template.base import Template
from django.http.response import HttpResponse
from django.template.context import Context
from django.middleware import csrf
from django.http import Http404
import json

from .forms import EditTaskForm
from .models import Task


def main_page(request):
    return render_to_response("index.html")


def get_csrf(request):
    t = Template("{{csrf_token_value}}")
    resp = t.render(Context({'csrf_token_value': csrf.get_token(request)}))
    return HttpResponse(resp)


def get_data_json(request):
    list_queryset = Task.objects.order_by('name')
    data_list = [{'id': item.id, 'name': item.name, 'text': item.text}
                 for item in list_queryset]
    data_dict = {obj['id']: {'name': obj['name'], 'text': obj['text']}
                 for obj in data_list}
    return JsonResponse({'dict': data_dict})


def add_data_json(request):

    def normalize_data(data_dict):
        '''Возвращает обратно словарь с готовыми ключами 'name' и 'text'
        или False, если данных не хватает или они не верны
        '''
        try:
            if 'name' in data_dict and len(data_dict['name']) > 0:
                if 'text' not in data_dict or len(data_dict['text']) == 0:
                    data_dict['text'] = ''
                    return data_dict
                elif 'text' in data_dict and len(data_dict['text']) > 0:
                    return data_dict
        except Exception:
            pass
        return False

    if request.method == "POST" \
            and request.content_type == 'application/json':
        data_dict = normalize_data(json.loads(request.body.decode()))
        if not data_dict:
            raise Http404("Incorrect sending data.")
        add_form = EditTaskForm(data_dict, request.FILES)
        if add_form.is_valid():
            add_form.save()


            return render_to_response("index.html")


        raise Http404("Sending data form not valid.")
    else:
        raise Http404("Not POST or no data.")
