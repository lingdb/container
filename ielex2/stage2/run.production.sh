#!/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
# When passing test as first parameter, binds to 127.0.0.1:8080.
last=$(docker ps -f "label=lingdb=postgres" -f label=deploy=production -f status=running -n=1 -q)
image="lingdb/ielex2_stage2"
name="lingdb_ielex2_stage2_$(date -I)_$(pwgen 5 1)"
label="-l deploy=production"
echo "Running $image against $last in production"
case $1 in
  test)
    docker run --link $last:postgres \
               --name $name \
               -p 127.0.0.1:8080:5000 \
               $label -d $image
  ;;
  *)
    docker run --link $last:postgres \
               --name $name \
               $label -d $image
  ;;
esac
