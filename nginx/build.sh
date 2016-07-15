#!/bin/bash
# Switching to scripts directory:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Cleaning ielexStatic:
rm -rf ielexStatic/*
cobl=$(docker create lingdb/cobl:latest)
docker cp $cobl:/CoBL/static ielexStatic
docker rm $cobl
cd ielexStatic
mv static/* .
rm -rf static
cd ..
# Building image:
image="lingdb/nginx"
docker build -t $image:latest .
