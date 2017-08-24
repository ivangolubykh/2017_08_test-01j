#!/bin/sh
# python3 manage.py makemigrations
# python3 manage.py migrate
# sudo docker exec 2017_test-01j_task_list_django python3 manage.py makemigrations
# sudo docker exec 2017_test-01j_task_list_django python3 manage.py migrate
# sudo chown -R ivan:ivan .

sleep 10
python3 manage.py runserver 0.0.0.0:8000 >>../django_logs/manage_py.log
#ping 127.0.0.1 >>../django_logs/manage_py.log
