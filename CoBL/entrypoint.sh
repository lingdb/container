#!/bin/bash
python manage.py migrate
gunicorn --threads 4 --bind=$(hostname -i):5000 wsgi:application
