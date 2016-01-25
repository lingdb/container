#!/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
last=$(docker ps -f "label=lingdb=postgres" -f status=running -n=1 -q)
image="lingdb/ielex2_stage0"
name="lingdb_ielex2_stage0_$(date -I)_$(pwgen 5 1)"
echo "Running $image against $last…"
docker run --link $last:postgres \
           --name $name \
           -it $image bash
echo "Committing $name as stage1…"
stage="lingdb/ielex2_stage1"
tag=$(grep version Dockerfile | grep -Po "\"[^\"]+\"" | sed -e "s/\"//g")
docker commit -a "Jakob Runge <mam09crm@studserv.uni-leipzig.de>" $name $stage:$tag
docker tag -f $stage:$tag $stage:latest
