#!/bin/bash
# Database setup:
# For better db password than '1234' see [1].
# [1]: https://github.com/Lukx/vagrant-lamp/blob/master/components/mariadb.sh
echo "Installing mysql-server:"
export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< 'mariadb-server-5.5 mysql-server/root_password password 1234'
debconf-set-selections <<< 'mariadb-server-5.5 mysql-server/root_password_again password 1234'
apt-get install -y mariadb-server
systemctl enable mysql
systemctl start mysql
#grant all privileges on *.* to root@localhost identified by '1234' with grant option
echo "CREATE DATABASE IF NOT EXISTS v5 CHARACTER SET utf8;"|mysql -uroot -p1234
echo "GRANT ALL PRIVILEGES ON *.* TO root@localhost IDENTIFIED BY '1234' WITH GRANT OPTION;"|mysql -uroot -p1234
echo "Creating v5 tables:"
mysql -uroot -p1234 v5 < /containerSetup/database/create.sql
echo "Inserting v5 dump:"
mysql -uroot -p1234 v5 < /containerSetup/database/dump.sql
# Install dumpdb stuff:
echo "Installing dumpdb.{service,timer}:"
apt-get install -y mariadb-client
cp /containerSetup/database/dumpdb.{service,timer} /etc/systemd/system
systemctl enable dumpdb.timer
systemctl start dumpdb.timer
# Setup for nginx:
echo "Installing nginx:"
apt-get install -y nginx
systemctl enable nginx
systemctl stop nginx
# Config for nginx & start:
rm /etc/nginx/sites-enabled/default
cp /containerSetup/nginx/soundcomparisons /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/soundcomparisons /etc/nginx/sites-enabled/soundcomparisons
# Setting sendfile off:
# https://docs.vagrantup.com/v2/synced-folders/virtualbox.html
# https://github.com/mitchellh/vagrant/issues/351#issuecomment-1339640
# https://stackoverflow.com/a/23487194/448591
sed -i.bak "s/sendfile on/sendfile off/g" /etc/nginx/nginx.conf
rm /etc/nginx/nginx.conf.bak
systemctl start nginx
# Fetching copy of website repository:
echo "Taking care of website submodule:"
git -C /containerSetup submodule init
git -C /containerSetup submodule update
echo "Installing fetchUpdate.{service,timer}:"
cp /containerSetup/update/fetchUpdate.{service,timer} /etc/systemd/system
#systemctl enable fetchUpdate.timer
#systemctl start fetchUpdate.timer
# Setup and start of flask:
echo "Performing flask setup:"
# Setup virtualenv and stuff:
apt-get install -y virtualenv python-pip build-essential python-dev libmysqlclient-dev
make -C /containerSetup/website clean
make -C /containerSetup/website install
# Copy config_example.py -> config.py:
cp /containerSetup/website/config_example.py /containerSetup/website/config.py
# Install and start serviceMagic for flask:
cp /containerSetup/flask/flask.service /etc/systemd/system
systemctl enable flask.service
systemctl start flask.service
