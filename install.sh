#!/bin/bash
echo "Updating package database:"
apt-get update
apt-get install -y docker.io pwgen
cd /containerSetup
./pullBaseImages.sh
./buildContainers.sh

echo "Starting some containers…"
cd /containerSetup/mariadb
./run.sh
cd /containerSetup/postgres
./run.sh
echo "Sleeping 30s to wait for database containers to come up…"
sleep 30s
cd /containerSetup/mariadb/create
./run.sh
cd /containerSetup/postgres/create
./run.sh
cd /containerSetup/mariadb/backup
./run.sh
cd /containerSetup/postgres/backup
./run.sh
cd /containerSetup/sndcomp
./run.sh
