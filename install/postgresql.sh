#!/bin/bash
echo "Installing PostgreSQL:"
apt-get install -y postgresql
asPG="sudo -u postgres"
dir="/containerSetup/postgresql"
# Recreating database:
echo "DROP DATABASE IF EXISTS ielexdb201510;" | $asPG psql
$asPG createdb -T template0 ielexdb201510
# (Re-)creating user:
$asPG psql < $dir/createUser.sql
# Filling database:
#$asPG psql ielexdb201510 < $dir/dump.sql
