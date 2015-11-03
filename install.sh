#!/bin/bash
echo "Updating package database:"
apt-get update
# Installing mariadb:
#/containerSetup/install/mariadb.sh
# Setup for nginx:
#/containerSetup/install/nginx.sh
# Installing soundcomparisons service:
#/containerSetup/install/soundcomparisons.sh
# Installing postgresql:
/containerSetup/install/postgresql.sh
# Installing lexdb service:
/containerSetup/install/lexdb.sh
