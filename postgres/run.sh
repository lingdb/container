#!/bin/bash
# https://hub.docker.com/_/postgres/
# Setup:
last=$(docker ps -f name=lingdb.postgres -f status=exited -n=1 -q)
name="lingdb.postgres.$(date -I).$(pwgen 5 1)"
pgsql="-e POSTGRES_USER=ielexuser -e POSTGRES_PASSWORD=abcd1234"
# Action:
docker run --name $name $pgsql -d postgres:9.3.10
echo "Container to start: $name"
if [ -z "$name" ]; then
  echo "No prior container found -> no volumes to reuse…"
  docker run --name $name $pgsql -d postgres:9.3.10
else
  echo "Reusing volumes from $last…"
  docker run --name $name $pgsql --volumes-from=$last -d postgres:9.3.10
fi
