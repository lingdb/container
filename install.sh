#!/bin/bash
# For better db password than '1234' see [1].
# [1]: https://github.com/Lukx/vagrant-lamp/blob/master/components/mariadb.sh
echo "Installing mysql-server:"
export DEBIAN_FRONTEND=noninteractive
debconf-set-selections <<< 'mariadb-server-5.5 mysql-server/root_password password 1234'
debconf-set-selections <<< 'mariadb-server-5.5 mysql-server/root_password_again password 1234'
apt-get install -y mariadb-server
service mysql start
echo "CREATE DATABASE IF NOT EXISTS v4 CHARACTER SET utf8;"|mysql -uroot -p1234
echo "FIXME REMEMBER DATABASE SETUP!"
echo "Installing nginx:"
apt-get install -y nginx
service nginx restart
