#!/bin/bash
dir="/ielex2"

echo "Editing …ielex/local_settings.py"
file="$dir/ielex/local_settings.py"
cp $file.dist $file
sed -i.bak "s/'ENGINE': 'django.db.backends.sqlite3',/'ENGINE':'django.db.backends.postgresql_psycopg2',/" $file
sed -i.bak "s/'NAME': os.path.join(ROOTDIR, 'db.sqlite3'),/'NAME':'ielexdb201510',/" $file
sed -i.bak "s/'USER': '',.*$/'USER':'ielexuser',/" $file
sed -i.bak "s/'PASSWORD': '',.*$/'PASSWORD':'abcd1234',/" $file
sed -i.bak "s/'HOST': '',.*$/'HOST':'localhost',/" $file
sed -i.bak "s/'^.*PORT': '',.*$//" $file
sed -i.bak "s/ALLOWED_HOSTS = \[/ALLOWED_HOSTS = \[\"127.0.0.1\"/" $file
sed -i.bak "s/STATIC_ROOT = \"\"/STATIC_ROOT = \"ielex/static/\"/" $file
secret=$(pwgen 32 1)
sed -i.bak "s/SECRET_KEY = \"<++>\"/SECRET_KEY = \"$secret\"/" $file
rm $file.bak

echo "Installing REQUIREMENTS"
cd $dir
pip install -r REQUIREMENTS
