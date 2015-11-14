#!/bin/bash
last=$(docker ps -f "name=lingdb/mariadb" -f status=running -n=1 -q)
image="lingdb/mariadb/create"
echo "Running $image against $last…"
docker run --link $last:mysql \
           -v `pwd`:/create \
           $image
