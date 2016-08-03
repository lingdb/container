#!/bin/bash
python manage.py migrate
pcount=$(grep -c "^processor" /proc/cpuinfo)
wcount=$(python -c "print($pcount * 2 + 1)")
gunicorn --workers $wcount --bind=$(hostname -i):5000 wsgi:application
