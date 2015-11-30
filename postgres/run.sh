#!/bin/bash
# https://hub.docker.com/_/postgres/
# Setup:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
source ../secrets/secrets.sh
last=$(docker ps -f label=lingdb=postgres -f status=exited -n=1 -q)
name="--name lingdb_postgres_$(date -I)_$(pwgen 5 1)"
pgsql="-e POSTGRES_USER=ielexuser -e POSTGRES_PASSWORD=$secretPostgreSQL"
label="-l lingdb=postgres"
# Action:
echo "Container to start: $name"
if [ "vagrant" == "$1" ]; then
  echo "Starting container for vagrant…"
  docker run $name $label $pgsql -p 0.0.0.0:5432:5432 -d postgres:9.3.10
elif [ -z "$last" ]; then
  echo "No prior container found -> no volumes to reuse…"
  docker run $name $label $pgsql -d postgres:9.3.10
else
  echo "Reusing volumes from $last…"
  docker run $name $label $pgsql --volumes-from=$last -d postgres:9.3.10
fi
