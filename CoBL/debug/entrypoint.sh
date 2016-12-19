#!/bin/bash
# Migrate database:
echo "migrate:"
python3 manage.py migrate
echo "exampleSetup:"
python3 manage.py exampleSetup
echo "runserver:"
# Start gunicorn:
pcount=$(grep -c "^processor" /proc/cpuinfo)
wcount=$(python3 -c "print($pcount * 2 + 1)")
gunicorn --workers $wcount --bind=$(hostname -i):5000 wsgi:application
