#!/bin/bash
# Switching into nginx directory:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
cd ../nginx
# Links to use:
sndcomp=$(docker ps -f "label=lingdb=sndcomp" -f status=running -n=1 -q)
# Checking start conditions:
image="lingdb/nginx_sndcomp"
name="lingdb_nginx_sndcomp_$(date -I)_$(pwgen 5 1)"
if [ -z "$sndcomp" ]; then
  echo "Not starting $image because lingdb_sndcomp isn't running."
else
  echo "Running $image linked against $sndcomp"
  docker run -p 0.0.0.0:80:80 \
             --name $name \
             --link $sndcomp:sndcomp \
             -v `pwd`/sound/:/sound \
             -d $image
fi
