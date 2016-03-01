#!/bin/bash
# Switching to scripts directory:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Copying files:
echo "Copying sndcomp static files:"
cp -r ../sndcomp/soundcomparisons/static/* sndcompStatic/
# Building image:
image="lingdb/nginx_sndcomp"
docker build -t $image:latest .
