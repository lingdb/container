#!/usr/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
last=$(docker ps -f name=lingdb.postgres -f status=running -n=1 --format="{{.Names}}")
image="lingdb.postgres.backup"
echo "Running $image against $last…"
docker run --link $last:postgres \
           -v `pwd`:/backup \
           -e PGPASSWORD=abcd1234 \
           -d $image
