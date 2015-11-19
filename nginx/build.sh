#!/bin/bash
# Switching to scripts directory:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Copying files:
echo "Copying ielex2 static files:"
cp -r ../ielex2/stage1/ielex2/static/* ielexStatic/
echo "Copying sndcomp static files:"
cp -r ../sndcomp/soundcomparisons/static/* sndcompStatic/
# Building image:
image="lingdb/nginx"
tag=$(date -I | sed -e 's/-/./g')
docker build -t $image:$tag .
docker tag -f $image:$tag $image:latest
