#!/bin/bash
# Links to use:
sndcomp=$(docker ps -f "label=lingdb=sndcomp.php" -f status=running -n=1 -q)
ielex=$(docker ps -f "label=lingdb=ielex_stage2" -f status=running -n=1 -q)
# Checking start conditions:
image="lingdb/nginx"
name="lingdb_nginx_$(date -I)_$(pwgen 5 1)"
if [ -z "$sndcomp" ]; then
  echo "Not starting $image because lingdb_sndcomp isn't running."
elif [ -z "$ielex" ]; then
  echo "Not starting $image because lingdb_ielex isn't running."
else
  echo "Running $image linked against $sndcomp and $ielex"
  docker run -p 0.0.0.0:80:80 \
             --name $name \
             --link $sndcomp:sndcomp \
             --link $ielex:ielex \
             -v `pwd`/sound/:/sound \
             -d $image
fi
