#!/bin/bash
# https://hub.docker.com/_/postgres/
# Setup:
last=$(docker ps -f name=lingdb_postgres -f status=exited -n=1 -q)
name="lingdb_postgres_$(date -I)_$(pwgen 5 1)"
pgsql="-e POSTGRES_USER=ielexuser -e POSTGRES_PASSWORD=abcd1234"
# Action:
echo "Container to start: $name"
if [ -z "$last" ]; then
  echo "No prior container found -> no volumes to reuse…"
  docker run --name $name $pgsql -d postgres:9.3.10
else
  echo "Reusing volumes from $last…"
  docker run --name $name $pgsql --volumes-from=$last -d postgres:9.3.10
fi
