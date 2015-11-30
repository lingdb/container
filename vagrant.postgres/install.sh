#!/bin/bash
echo "Updating package database:"
apt-get update
apt-get install -y docker.io pwgen
cd /containerSetup
# Building more containers than we need just to have a common build script:
docker pull postgres:9.3.10
(cd postgres/create && ./build.sh)
vagrant.postgres/run.sh
# Installing upstart service:
cp /containerSetup/vagrant.postgres/postgres.upstart /etc/init/postgres.conf
