#!/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
sndcomp=$(docker ps -f "name=lingdb.sndcomp" -f status=running -n=1 --format "{{.Names}}")
ielex=$(docker ps -f "name=lingdb.ielex2.stage2" -f status=running -n=1 --format "{{.Names}}")
docker run --link $sndcomp:sndcomp \
           --link $ielex:ielex \
           -p 127.0.0.1:8080:80 \
           -d lingdb.nginx
