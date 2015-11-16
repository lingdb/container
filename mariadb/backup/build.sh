#!/bin/bash
image="lingdb/mariadb_backup"
tag=$(date -I | sed -e 's/-/./g')
docker build -t $image:$tag .
docker tag -f $image:$tag $image:latest
