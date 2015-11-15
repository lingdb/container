#!/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
# When passing test as first parameter, binds to 127.0.0.1:8080.
last=$(docker ps -f "name=lingdb_postgres" -f status=running -n=1 -q)
image="lingdb/ielex2_stage2"
name="lingdb_ielex2_stage2_$(date -I)_$(pwgen 5 1)"
echo "Running $image against $last…"
case $1 in
  test)
    docker run --link $last:postgres \
               --name $name \
               -p 127.0.0.1:8080:5000 \
               -d $image
  ;;
  *)
    docker run --link $last:postgres \
               --name $name \
               -d $image
  ;;
esac
