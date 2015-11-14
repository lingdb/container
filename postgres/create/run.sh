#!/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
last=$(docker ps -f name=lingdb/postgres -f status=running -n=1 -q)
image="lingdb/postgres/create"
echo "Running $image against $last…"
docker run --link $last:postgres \
           -v `pwd`:/create \
           -e PGPASSWORD=abcd1234 \
           -it $image
