#!/bin/bash
# Setup for nginx:
echo "Installing nginx:"
apt-get install -y nginx
service nginx stop
# Config for nginx & start:
enabled="/etc/nginx/sites-enabled"
available="/etc/nginx/sites-available"
rm $enabled/default
ln -s /containerSetup/nginx/siteconfig $available/siteconfig
ln -s $available/siteconfig $enabled/siteconfig
# Setting sendfile off:
# https://docs.vagrantup.com/v2/synced-folders/virtualbox.html
# https://github.com/mitchellh/vagrant/issues/351#issuecomment-1339640
# https://stackoverflow.com/a/23487194/448591
sed -i.bak "s/sendfile on/sendfile off/g" /etc/nginx/nginx.conf
rm /etc/nginx/nginx.conf.bak
service nginx start
