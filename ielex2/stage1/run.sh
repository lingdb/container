#!/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
last=$(docker ps -f "name=lingdb.postgres" -f status=running -n=1 --format "{{.Names}}")
image="lingdb.ielex2.stage0"
name="lingdb.ielex2.stage0.$(date -I)"
echo "Running $image against $last…"
docker run --link $last:postgres \
           --name $name \
           -it $image bash
echo "Committing $name as stage1…"
docker commit -a "Jakob Runge <mam09crm@studserv.uni-leipzig.de>" $name lingdb.ielex2.stage1
