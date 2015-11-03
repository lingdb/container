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
