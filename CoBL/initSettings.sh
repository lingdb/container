#!/bin/bash
file="/CoBL/ielex/local_settings.py"
if [ ! -f $file ]; then
  cp $file.dist $file
  sed -i.bak "s/'ENGINE': 'django.db.backends.sqlite3',/'ENGINE': 'django.db.backends.postgresql_psycopg2',/" $file
  sed -i.bak "s/'NAME': os.path.join(os.path.abspath(os.path.dirname(__file__)), 'db.sqlite3'),/'NAME': 'ielexdb201510',/" $file
  sed -i.bak "s/'USER': '',.*$/'USER':'ielexuser',/" $file
  sed -i.bak "s/'PASSWORD': '',.*$/'PASSWORD':'$POSTGRES_PASSWORD',/" $file
  sed -i.bak "s/'HOST': '',.*$/'HOST':'postgres',/" $file
  sed -i.bak "s/'PORT': '',.*$/'PORT': '5432',/" $file
  sed -i.bak "s/ALLOWED_HOSTS = \[/ALLOWED_HOSTS = \[\"127.0.0.1\"/" $file
  sed -i.bak "s/STATIC_ROOT = .\"/STATIC_ROOT = \"ielex\/static\/\"/" $file
  secret=$(pwgen 32 1)
  sed -i.bak "s/SECRET_KEY = \"<++>\"/SECRET_KEY = \"$secret\"/" $file
  sed -i.bak "s/project_long_name = u\"Test Lexical Cognacy Database\"/project_long_name = u\"CoBL\"/" $file
  sed -i.bak "s/project_short_name = u\"TestLex\"/project_short_name = u\"CoBL\"/" $file
  sed -i.bak "s/project_description = u\"\"\"Description for the front page\"\"\"/project_description = u\"\"\"Welcome to the CoBL website.\"\"\"/" $file
  rm $file.bak
fi