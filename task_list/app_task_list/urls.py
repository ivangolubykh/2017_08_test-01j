"""django_02 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from .views import main_page, get_csrf, get_data_json, add_data_json, \
    edit_data_json, del_data_json


urlpatterns = [
    url(r'^$', main_page, name='main'),
    url(r'^get_data_json/$', get_data_json, name='get_data_json'),
    url(r'^add_data_json/$', add_data_json, name='add_data_json'),
    url(r'^edit_data_json/$', edit_data_json, name='edit_data_json'),
    url(r'^del_data_json/$', del_data_json, name='del_data_json'),
    url(r'^get_csrf/$', get_csrf, name='get_csrf'),
]
