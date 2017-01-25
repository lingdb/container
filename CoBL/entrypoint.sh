#!/bin/sh
# Copy static files:
cp -rf /CoBL/static/* /copyStatic/
# Migrate database:
python3 manage.py migrate
# Start gunicorn:
pcount=$(grep -c "^processor" /proc/cpuinfo)
wcount=$(python3 -c "print($pcount * 2 + 1)")
gunicorn --workers $wcount --bind=$(hostname -i):5000 wsgi:application
