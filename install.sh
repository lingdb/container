#!/bin/bash
# Database setup:
# For better db password than '1234' see [1].
# [1]: https://github.com/Lukx/vagrant-lamp/blob/master/components/mariadb.sh
echo "Installing mysql-server:"
export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< 'mariadb-server-5.5 mysql-server/root_password password 1234'
debconf-set-selections <<< 'mariadb-server-5.5 mysql-server/root_password_again password 1234'
apt-get install -y mariadb-server
service mysql start
#grant all privileges on *.* to root@localhost identified by '1234' with grant option
echo "CREATE DATABASE IF NOT EXISTS v5 CHARACTER SET utf8;"|mysql -uroot -p1234
echo "GRANT ALL PRIVILEGES ON *.* TO root@localhost IDENTIFIED BY '1234' WITH GRANT OPTION;"|mysql -uroot -p1234
echo "Creating v5 tables:"
mysql -uroot -p1234 v5 < /containerSetup/database/create.sql
echo "Inserting v5 dump:"
mysql -uroot -p1234 v5 < /containerSetup/database/dump.sql
# Install dumpdb stuff:
echo "Installing dumpdb.sh:"
apt-get install -y mariadb-client
ln -s /containerSetup/database/dumpdb.cron.daily.sh /etc/cron.daily
# Setup for nginx:
echo "Installing nginx:"
apt-get install -y nginx
service nginx stop
# Config for nginx & start:
rm /etc/nginx/sites-enabled/default
ln -s /containerSetup/nginx/soundcomparisons /etc/nginx/sites-available/soundcomparisons
ln -s /etc/nginx/sites-available/soundcomparisons /etc/nginx/sites-enabled/soundcomparisons
# Setting sendfile off:
# https://docs.vagrantup.com/v2/synced-folders/virtualbox.html
# https://github.com/mitchellh/vagrant/issues/351#issuecomment-1339640
# https://stackoverflow.com/a/23487194/448591
sed -i.bak "s/sendfile on/sendfile off/g" /etc/nginx/nginx.conf
rm /etc/nginx/nginx.conf.bak
service nginx start
# Fetching copy of soundcomparisons repository:
echo "Taking care of soundcomparisons submodule:"
apt-get install -y git
git -C /containerSetup submodule init
git -C /containerSetup submodule update
# Setup and start of flask:
echo "Performing flask setup:"
# Setup virtualenv and stuff:
apt-get install -y python-virtualenv python-pip build-essential python-dev libmysqlclient-dev
make -C /containerSetup/soundcomparisons clean
make -C /containerSetup/soundcomparisons install
# Copy config_example.py -> config.py:
cp /containerSetup/soundcomparisons/config_example.py /containerSetup/soundcomparisons/config.py
# Install and start serviceMagic for flask:
cp /containerSetup/flask/flask.upstart /etc/init/flask.conf
service flask start
