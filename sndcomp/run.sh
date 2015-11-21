#!/bin/bash
# Switch into container/nginx:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
cd ../nginx
# Start sndcomp container from container/nginx:
last=$(docker ps -f "name=lingdb_mariadb" -f status=running -n=1 -q)
image="lingdb/sndcomp"
name="lingdb_sndcomp_$(date -I)_$(pwgen 5 1)"
if [ -z "$last" ]; then
  echo "Not starting $image because lingdb_mariadb isn't running."
else
  echo "Running $image against $last…"
  docker run --link $last:mysql \
             --name $name \
             -v sound:/sndcomp/static/sound \
             -d $image
fi
