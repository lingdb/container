#!/bin/bash
last=$(docker ps -f "label=lingdb=mariadb" -f status=running -n=1 -q)
image="lingdb/mariadb_create"
echo "Running $image against $last…"
docker run --link $last:mysql \
           -v `pwd`:/create \
           -d $image
