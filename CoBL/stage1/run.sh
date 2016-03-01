#!/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
last=$(docker ps -f "label=lingdb=postgres" -f status=running -n=1 -q)
image="lingdb/cobl_stage0"
name="lingdb_cobl_stage0_$(date -I)_$(pwgen 5 1)"
echo "Running $image against $last…"
docker run --link $last:postgres \
           --name $name \
           -v `pwd`/ielex2:/ielex2 \
           -it $image
echo "Committing $name as stage1…"
stage="lingdb/cobl_stage1"
docker commit -a "Jakob Runge <mam09crm@studserv.uni-leipzig.de>" $name $stage:latest
