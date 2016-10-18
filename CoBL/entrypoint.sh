#!/bin/bash
# Setting up local_settings.py:
file="/CoBL/ielex/local_settings.py"
cp $file.dist $file
sed -i.bak "s/'NAME': 'CoBL',/'NAME': 'ielexdb201510',/" $file
sed -i.bak "s/'USER': '',.*$/'USER':'ielexuser',/" $file
sed -i.bak "s/'PASSWORD': '',.*$/'PASSWORD':'$POSTGRES_PASSWORD',/" $file
sed -i.bak "s/'HOST': '',.*$/'HOST':'postgres',/" $file
sed -i.bak "s/'PORT': '',.*$/'PORT': '5432',/" $file
sed -i.bak "s/SECRET_KEY = \"<++>\"/SECRET_KEY = \"$DJANGO_SECRET\"/" $file
rm $file.bak
# Copy static files:
cp -rf /CoBL/static/* /copyStatic/
# Migrate database:
python manage.py migrate
# Start gunicorn:
pcount=$(grep -c "^processor" /proc/cpuinfo)
wcount=$(python -c "print($pcount * 2 + 1)")
gunicorn --workers $wcount --bind=$(hostname -i):5000 wsgi:application
