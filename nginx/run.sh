#!/bin/bash
sndcomp=$(docker ps -f "name=lingdb.sndcomp" -f status=running -n=1 -q)
ielex=$(docker ps -f "name=lingdb.ielex2.stage2" -f status=running -n=1 -q)
image="lingdb.nginx"
name="$image.$(date -I).$(pwgen 5 1)"
if [ -z "$sndcomp" -a -z "$ielex" ]; then
  echo "Not starting nginx because neither sndcomp nor ielex are available."
elif [ -z "$sndcomp" ]; then
  echo "Not starting nginx because sndcomp is not available."
elif [ -z "$ielex" ]; then
  echo "Not starting nginx because ielex is not available."
else
  echo "Starting nginx with sndcomp and ielex…"
  docker run --link $sndcomp:sndcomp \
             --link $ielex:ielex \
             -p 0.0.0.0:80:80 \
             --name $name \
             -d $image
fi
