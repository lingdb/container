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
echo "CREATE DATABASE IF NOT EXISTS v4 CHARACTER SET utf8;"|mysql -uroot -p1234
echo "Creating v4 tables:"
mysql -uroot -p1234 v4 < /containerSetup/database/create.sql
echo "Inserting v4 dump:"
mysql -uroot -p1234 v4 < /containerSetup/database/dump.sql
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
systemctl start nginx
