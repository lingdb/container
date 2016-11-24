#!/bin/bash
# Migrate database:
echo "migrate:"
python manage.py migrate
echo "exampleSetup:"
python manage.py exampleSetup
echo "runserver:"
# Start gunicorn:
pcount=$(grep -c "^processor" /proc/cpuinfo)
wcount=$(python -c "print($pcount * 2 + 1)")
gunicorn --workers $wcount --bind=$(hostname -i):5000 wsgi:application
