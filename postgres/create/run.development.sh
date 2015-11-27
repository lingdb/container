#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
source ../../secrets/secrets.sh
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
last=$(docker ps -f label=lingdb=postgres -f label=deploy=development -f status=running -n=1 -q)
image="lingdb/postgres_create"
label="-l deploy=development"
echo "Running $image against $last in development"
docker run --link $last:postgres \
           -v `pwd`:/create \
           -e PGPASSWORD=$secretPostgreSQL \
           $label -it $image