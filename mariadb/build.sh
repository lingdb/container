#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Building image:
image="lingdb/mariadb"
tag=$(date -I | sed -e 's/-/./g')
docker build -t $image:$tag .
docker tag -f $image:$tag $image:latest
