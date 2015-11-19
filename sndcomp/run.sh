#!/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
last=$(docker ps -f "name=lingdb_mariadb" -f status=running -n=1 -q)
image="lingdb/sndcomp"
name="lingdb_sndcomp_$(date -I)_$(pwgen 5 1)"
if [ -z "$last" ]; then
  echo "Not starting $image because lingdb_mariadb isn't running."
else
  echo "Running $image against $last…"
  docker run --link $last:mysql \
             --name $name \
             -d $image
fi
