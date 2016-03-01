#!/bin/bash
# Use with source ./loadSecrets.sh
source ./secrets.sh
export MYSQL_ROOT_PASSWORD=$secretMariaDB
export POSTGRES_PASSWORD=$secretPostgreSQL
