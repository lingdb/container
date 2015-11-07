#!/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
last=$(docker ps -f "name=lingdb.postgres" -f status=running -n=1 --format "{{.Names}}")
image="lingdb.ielex2.stage2"
name="$image.$(date -I)"
echo "Running $image against $last…"
docker run --link $last:postgres \
           --name $name \
           -d $image
