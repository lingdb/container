#!/bin/bash
# Fetching copy of the ielex repository:
# Got to move .gitignore out of the way intermediate,
# because hg won't clone into a non empty repo.
echo "Taking care of ielex:"
apt-get install -y \
  mercurial \
  python-virtualenv \
  python-pip \
  build-essential \
  python-dev \
  postgresql-server-dev-9.3 \
  libxml2{,-dev} \
  libxslt-dev \
  python2.7-lxml \
  pwgen zlib1g-dev
ielex="/containerSetup/ielex2"
asV="sudo -u vagrant"
# FIXME this is currently broken…
# mv $ielex/.gitignore /tmp/ielex.gitignore
# $asV hg clone https://bitbucket.org/evoling/ielex $ielex
# mv /tmp/ielex.gitignore $ielex/.gitignore
# $asV hg checkout -R $ielex py2.7-django1.8
# Setting up environment and installing packages:
#$asV virtualenv -p python2.7 $ielex
#$asV $ielex/bin/pip install -r $ielex/REQUIREMENTS
echo "Editing …ielex/local_settings.py"
file="$ielex/ielex/local_settings.py"
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
# FIXME this is currently broken…
# Trigger Anaconda setup:
asEnv="$asV env HOME=\"/home/vagrant\""
#$asEnv /containerSetup/anaconda.sh
#$asEnv pip install -r $ielex/REQUIREMENTS
# manage.py syncdb
# manage.py migrate
# manage.py shell + fill with data
# Serve and be happy
# $asV $ielex/bin/python $ielex/manage.py makemigrations
# $asV $ielex/bin/python $ielex/manage.py migrate
# Install and start service magic for ielex.sh:
# cp /containerSetup/install/ielex.upstart /etc/init/ielex.conf
# service ielex start
