#!/bin/bash
# Switching to scripts directory:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Copying files:
echo "Copying sndcomp static files:"
cp -r ../sndcomp/soundcomparisons/static/* sndcompStatic/
# Building image:
image="lingdb/nginx_sndcomp"
tag=$(date -I | sed -e 's/-/./g')
docker build -t $image:$tag .
docker tag -f $image:$tag $image:latest
