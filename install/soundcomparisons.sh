#!/bin/bash
# Fetching copy of soundcomparisons repository:
echo "Taking care of soundcomparisons submodule:"
apt-get install -y git
git -C /containerSetup submodule init
git -C /containerSetup submodule update
# Setup and start of flask:
echo "Performing flask setup:"
# Setup virtualenv and stuff:
apt-get install -y python-virtualenv python-pip build-essential python-dev libmysqlclient-dev pwgen
dir="/containerSetup/soundcomparisons"
make -C $dir clean
make -C $dir install
# Copy config_example.py -> config.py:
cp $dir/config_example.py $dir/config.py
secret=$(pwgen 32 1)
sed -i.bak "s/Zooj8eegie4sheequ2ohfoh6pu0goKae/$secret/" $dir/config.py
rm $dir/config.py.bak
# Install and start service magic for flask:
cp /containerSetup/install/soundcomparisons.upstart /etc/init/soundcomparisons.conf
service soundcomparisons start
