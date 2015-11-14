#!/bin/bash
last=$(docker ps -f "name=lingdb_mariadb" -f status=running -n=1 -q)
image="lingdb/mariadb/backup"
echo "Running $image against $last…"
docker run --link $last:mysql \
           -v `pwd`:/backup \
           -d $image
