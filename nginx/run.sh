#!/bin/bash
# Links to use:
sndcomp=$(docker ps -f "label=lingdb=sndcomp.php" -f status=running -n=1 -q)
cobl=$(docker ps -f "label=lingdb=cobl" -f status=running -n=1 -q)
# Checking start conditions:
image="lingdb/nginx"
name="lingdb_nginx_$(date -I)_$(pwgen 5 1)"
if [ -z "$sndcomp" ]; then
  echo "Not starting $image because lingdb_sndcomp isn't running."
elif [ -z "$cobl" ]; then
  echo "Not starting $image because lingdb_cobl isn't running."
else
  echo "Running $image linked against $sndcomp and $ielex"
  docker run -p 0.0.0.0:80:80 \
             --name $name \
             --link $sndcomp:sndcomp \
             --link $cobl:cobl \
             -v `pwd`/sound/:/sound \
             -d $image
fi
