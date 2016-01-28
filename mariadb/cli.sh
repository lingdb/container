#!/bin/bash
# https://hub.docker.com/_/mariadb/
# Setup:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
source ../secrets/secrets.sh
last=$(docker ps -f label=lingdb=mariadb -f status=running -n=1 -q)
# Action:
if [ -z "$last" ]; then
  echo "No running container found."
else
  docker exec -it $last env TERM=xterm-256color mysql -uroot -p$secretMariaDB v4
fi
