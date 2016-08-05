#!/bin/bash
# Copy static files if requested:
if [ -d /copyStatic ]; then
  cp -rf /CoBL/static/* /copyStatic/
fi
# Migrate database:
python manage.py migrate
# Start gunicorn:
pcount=$(grep -c "^processor" /proc/cpuinfo)
wcount=$(python -c "print($pcount * 2 + 1)")
gunicorn --workers $wcount --bind=$(hostname -i):5000 wsgi:application
