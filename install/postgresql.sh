#!/bin/bash
echo "Installing PostgreSQL:"
apt-get install -y postgresql
asPG="sudo -u postgres"
dir="/containerSetup/postgresql"
$asPG createuser -D -A ielexuser
$asPG createdb -T template0 -O ielexuser ielexdb201510
$asPG psql < $dir/createUser.sql
$asPG psql ielexdb201510 < $dir/dump.sql
