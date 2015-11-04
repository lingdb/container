#!/bin/bash
# Fetching copy of the lexdb repository:
# Got to move .gitignore out of the way intermediate,
# because hg won't clone into a non empty repo.
echo "Taking care of lexdb:"
apt-get install -y mercurial python-virtualenv python-pip build-essential python-dev postgresql-server-dev-9.3 libxml2-dev libxslt-dev python2.7-lxml pwgen
lexdb="/containerSetup/lexdb"
mv $lexdb/.gitignore /tmp/lexdb.gitignore
sudo -u vagrant hg clone https://bitbucket.org/evoling/lexdb $lexdb
mv /tmp/lexdb.gitignore $lexdb/.gitignore
sudo -u vagrant hg checkout -R $lexdb py2.7-django1.8
# Setting up environment and installing packages:
sudo -u vagrant virtualenv -p python2.7 $lexdb
sudo -u vagrant $lexdb/bin/pip install -r $lexdb/REQUIREMENTS
# Workaround because of build problems with lxml, see https://github.com/lingdb/container/issues/2:
grep -v '#' $lexdb/REQUIREMENTS-DEV | grep -v lxml | xargs sudo -u vagrant $lexdb/bin/pip install
echo "Editing …ielex/local_settings.py"
file="$lexdb/ielex/local_settings.py"
cp $file.dist $file
sed -i.bak "s/'ENGINE': 'django.db.backends.sqlite3',/'ENGINE':'django.db.backends.postgresql_psycopg2',/" $file
sed -i.bak "s/'NAME': os.path.join(ROOTDIR, 'db.sqlite3'),/'NAME':'ielexdb201510',/" $file
sed -i.bak "s/'USER': '',.*$/'USER':'ielexuser',/" $file
sed -i.bak "s/'PASSWORD': '',.*$/'PASSWORD':'abcd1234',/" $file
sed -i.bak "s/'HOST': '',.*$/'HOST':'localhost',/" $file
sed -i.bak "s/'^.*PORT': '',.*$//" $file
sed -i.bak "s/ALLOWED_HOSTS = \[/ALLOWED_HOSTS = \[\"127.0.0.1:5001\"/" $file
secret=$(pwgen 32 1)
sed -i.bak "s/SECRET_KEY = \"<++>\"/SECRET_KEY = \"$secret\"/" $file
rm $file.bak
# SyncDB:
# FIXME how to make step below non interactive?!
#./bin/python manage.py syncdb
# Install and start service magic for lexdb.sh:
cp /containerSetup/install/lexdb.upstart /etc/init/lexdb.conf
service lexdb start
