#!/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
last=$(docker ps -f "name=lingdb.mariadb" -f status=running -n=1 -q)
image="lingdb.sndcomp"
name="$image.$(date -I).$(pwgen 5 1)"
if [ -z "$last" ]; then
  echo "Not starting $image because lingdb.mariadb isn't running."
else
  echo "Running $image against $last…"
  docker run --link $last:mysql \
             -v `pwd`/sound:/sndcomp/static/sound \
             --name $name \
             -d $image
fi
