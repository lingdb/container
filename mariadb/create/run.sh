#!/bin/bash
last=$(docker ps -f "name=lingdb_mariadb" -f status=running -n=1 -q)
image="lingdb/mariadb_create"
echo "Running $image against $last…"
docker run --link $last:mysql \
           -v `pwd`:/create \
           $image
