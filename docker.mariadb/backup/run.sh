#!/usr/bin/bash
last=$(docker ps -f "name=lingdb.mariadb" -f status=running -n=1 --format "{{.Names}}")
image="lingdb.mariadb.backup"
echo "Running $image against $last…"
docker run --link $last:mysql \
           -v `pwd`:/backup \
           -d $image
