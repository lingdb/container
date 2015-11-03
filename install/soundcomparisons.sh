#!/bin/bash
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
