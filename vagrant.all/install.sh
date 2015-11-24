#!/bin/bash
echo "Updating package database:"
apt-get update
apt-get install -y docker.io pwgen
cd /containerSetup
./build.sh
./run.sh
# Installing upstart service:
cp /containerSetup/vagrant.all/sndcomp.upstart /etc/init/sndcomp.conf