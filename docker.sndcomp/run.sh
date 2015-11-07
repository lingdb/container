#!/usr/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
last=$(docker ps -f "name=lingdb.mariadb" -f status=running -n=1 --format "{{.Names}}")
image="lingdb.sndcomp"
name="$image.$(date -I)"
echo "Running $image against $last…"
docker run --link $last:mysql \
           -v `pwd`/sound:/sndcomp/static/sound \
           --name $name \
           -d $image
