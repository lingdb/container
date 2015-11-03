#!/bin/bash
# Fetching copy of the lexdb repository:
# Got to move .gitignore out of the way intermediate,
# because hg won't clone into a non empty repo.
echo "Taking care of lexdb:"
apt-get install -y mercurial python-virtualenv python-pip build-essential python-dev postgresql-server-dev-9.3 libxml2-dev libxslt-dev
mv /containerSetup/lexdb/.gitignore /tmp/lexdb.gitignore
sudo -u vagrant hg clone https://bitbucket.org/evoling/lexdb /containerSetup/lexdb
mv /tmp/lexdb.gitignore /containerSetup/lexdb/.gitignore
sudo -u vagrant hg checkout -R /containerSetup/lexdb py2.7-django1.8
# Setting up environment and installing packages:
sudo -u vagrant virtualenv -p python2.7 /containerSetup/lexdb
#cp /containerSetup/requirements.txt /containerSetup/lexdb
chdir /containerSetup/lexdb
sudo -u vagrant ./bin/pip -r REQUIREMENTS
sudo -u vagrant ./bin/pip -r REQUIREMENTS-DEV
# SyncDB:
# FIXME how to make step below non interactive?!
./bin/python manage.py syncdb
# Adjust ALLOWED_HOSTS:
sed -i.bak "s/ALLOWED_HOSTS = [/ALLOWED_HOSTS = [\"127.0.0.1:5001\"g" ./ielex/local_settings.py
