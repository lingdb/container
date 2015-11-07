#!/bin/bash
base=$(pwd)
# Pulling all the base images that the containers build upon.
echo "Getting containers ready…"
containers="$base/mariadb/create $base/mariadb/backup $base/postgres/create $base/postgres/backup $base/sndcomp $base/ielex2 $base/nginx"
for cont in $containers; do
  echo "Now building $cont"
  cd $cont
  ./build.sh
done
