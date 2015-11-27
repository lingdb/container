#!/bin/bash
# Links to use:
sndcomp=$(docker ps -f label=lingdb=sndcomp -f status=running -n=1 -q)
ielexp=$(docker ps -f label=lingdb=ielex_stage2 -f label=deploy=production-f status=running -n=1 -q)
ielexd=$(docker ps -f label=lingdb=ielex_stage2 -f label=deploy=development-f status=running -n=1 -q)
# Checking start conditions:
image="lingdb/nginx"
name="lingdb_nginx_$(date -I)_$(pwgen 5 1)"
if [ -z "$sndcomp" ]; then
  echo "Not starting $image because lingdb_sndcomp isn't running."
elif [ -z "$ielexp" ]; then
  echo "Not starting $image because lingdb_ielex isn't running in production."
elif [ -z "$ielexd" ]; then
  echo "Not starting $image because lingdb_ielex isn't running in development."
else
  echo "Running $image linked against $sndcomp and $ielex"
  docker run -p 0.0.0.0:80:80 \
             --name $name \
             --link $sndcomp:sndcomp \
             --link $ielexp:ielexp \
             --link $ielexd:ielexd \
             -v `pwd`/sound/:/sound \
             -d $image
fi
