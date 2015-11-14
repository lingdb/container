#!/bin/bash
# https://hub.docker.com/_/mariadb/
# Setup:
last=$(docker ps -f name=lingdb/mariadb -f status=exited -n=1 -q)
name="lingdb_mariadb_$(date -I)_$(pwgen 5 1)"
mysql="-e MYSQL_ROOT_PASSWORD=1234 -e MYSQL_DATABASE=v5"
# Action:
echo "Container to start: $name"
if [ -z "$last" ]; then
  echo "No prior container found -> no volumes to reuse…"
  docker run --name $name $mysql -d mariadb:latest
else
  echo "Reusing volumes from $last…"
  docker run --name $name $mysql --volumes-from=$last -d mariadb:latest
fi
