#!/bin/bash
python manage.py migrate
gunicorn --workers 8 --bind=$(hostname -i):5000 wsgi:application
