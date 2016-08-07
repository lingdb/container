#!/bin/bash
# Setting up local_settings.py:
file="/CoBL/ielex/local_settings.py"
cp $file.dist $file
sed -i.bak "s/'ENGINE': 'django.db.backends.sqlite3',/'ENGINE': 'django.db.backends.postgresql_psycopg2',/" $file
sed -i.bak "s/'NAME': os.path.join(os.path.abspath(os.path.dirname(__file__)), 'db.sqlite3'),/'NAME': 'ielexdb201510',/" $file
sed -i.bak "s/'USER': '',.*$/'USER':'ielexuser',/" $file
sed -i.bak "s/'PASSWORD': '',.*$/'PASSWORD':'$POSTGRES_PASSWORD',/" $file
sed -i.bak "s/'HOST': '',.*$/'HOST':'postgres',/" $file
sed -i.bak "s/'PORT': '',.*$/'PORT': '5432',/" $file
sed -i.bak "s/SECRET_KEY = \"<++>\"/SECRET_KEY = \"$DJANGO_SECRET\"/" $file
rm $file.bak
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
