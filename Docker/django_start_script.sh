#!/bin/sh
# python manage.py makemigrations
# python manage.py migrate
# sudo docker exec 2017_test-01j_task_list_django python manage.py makemigrations
# sudo docker exec 2017_test-01j_task_list_django python manage.py migrate
# sudo chown -R ivan:ivan .

python manage.py runserver 0.0.0.0:8000 &>../django_logs/manage_py.log  # вывод в файл STDERR и STDOUT
ping 127.0.0.1
