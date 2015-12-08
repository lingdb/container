#!/bin/bash
# Loading secrets:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
source ../../secrets/secrets.sh
# Modifying config:
dir="./ielex2"
echo "Editing …ielex/local_settings.py"
file="$dir/ielex/local_settings.py"
cp $file.dist $file
sed -i.bak "s/'ENGINE': 'django.db.backends.sqlite3',/'ENGINE':'django.db.backends.postgresql_psycopg2',/" $file
sed -i.bak "s/'NAME': os.path.join(ROOTDIR, 'db.sqlite3'),/'NAME':'ielexdb201510',/" $file
sed -i.bak "s/'USER': '',.*$/'USER':'ielexuser',/" $file
sed -i.bak "s/'PASSWORD': '',.*$/'PASSWORD':'$secretPostgreSQL',/" $file
sed -i.bak "s/'HOST': '',.*$/'HOST':'postgres',/" $file
sed -i.bak "s/'PORT': '',.*$/'PORT': '5432',/" $file
sed -i.bak "s/ALLOWED_HOSTS = \[/ALLOWED_HOSTS = \[\"127.0.0.1\"/" $file
sed -i.bak "s/STATIC_ROOT = .\"/STATIC_ROOT = \"ielex\/static\/\"/" $file
secret=$(pwgen 32 1)
sed -i.bak "s/SECRET_KEY = \"<++>\"/SECRET_KEY = \"$secret\"/" $file
sed -i.bak "s/project_long_name = u\"Test Lexical Cognacy Database\"/project_long_name = u\"IELex 2\"/" $file
sed -i.bak "s/project_short_name = u\"TestLex\"/project_short_name = u\"IELex 2\"/" $file
sed -i.bak "s/project_description = u\"\"\"Description for the front page\"\"\"/project_description = u\"\"\"Welcome to the IELex 2 website.\"\"\"/" $file
rm $file.bak
# Building image:
echo "Starting build…"
image="lingdb/ielex2_stage0"
tag=$(date -I | sed -e 's/-/./g')
docker build -t $image:$tag .
docker tag -f $image:$tag $image:latest
