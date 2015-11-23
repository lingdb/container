#!/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
last=$(docker ps -f label=lingdb=postgres -f status=running -n=1 -q)
image="lingdb/postgres_backup"
echo "Running $image against $last…"
docker run --link $last:postgres \
           -v `pwd`:/backup \
           -e PGPASSWORD=abcd1234 \
           -d $image
