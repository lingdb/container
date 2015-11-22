#!/bin/bash
echo "Updating package database:"
apt-get update
apt-get install -y docker.io pwgen
cd /containerSetup
# Building more containers than we need just to have a common build script:
./build.sh
vagrant.sndcomp/run.sh
# Installing upstart service:
cp /containerSetup/vagrant.sndcomp/sndcomp.upstart /etc/init/sndcomp.conf
