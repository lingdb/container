#!/bin/bash
echo "Updating package database:"
apt-get update
apt-get install -y docker.io pwgen
cd /containerSetup
# Building more containers than we need just to have a common build script:
./build.sh
# Following parts inspired by ../run.sh:
echo "Starting database container…"
(cd mariadb && ./run.sh)
echo "Sleeping 30s to wait for database containers to come up…"
sleep 30s
echo "Initializing database container…"
(cd mariadb/create && ./run.sh)
echo "Starting web apps…"
(cd sndcomp && ./run.sh)
# FIXME what here?
# (cd nginx && ./run.sh)
