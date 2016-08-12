#!/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
last=$(docker ps -f "label=lingdb=postgres" -f status=running -n=1 -q)
image="lingdb/cobl_nexus"
name="lingdb_cobl_nexus_$(date -I)_$(pwgen 5 1)"
echo "Running $image against $last…"
docker run --link $last:postgres \
           --name $name \
           -d $image
