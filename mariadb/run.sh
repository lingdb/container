#!/bin/bash
# https://hub.docker.com/_/mariadb/
# Setup:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
source ../secrets/secrets.sh
last=$(docker ps -f label=lingdb=mariadb -f status=exited -n=1 -q)
name="--name lingdb_mariadb_$(date -I)_$(pwgen 5 1)"
mysql="-e MYSQL_ROOT_PASSWORD=$secretMariaDB -e MYSQL_DATABASE=v4"
image="lingdb/mariadb"
# Action:
echo "Container to start: $name"
if [ -z "$last" ]; then
  echo "No prior container found -> no volumes to reuse…"
  docker run $name $mysql -d $image
else
  echo "Reusing volumes from $last…"
  docker run $name $mysql --volumes-from=$last -d $image
fi
