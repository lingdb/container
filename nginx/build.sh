#!/bin/bash
# Switching to scripts directory:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Copying files:
echo "Copying CoBL static files:"
cp -r ../CoBL/stage1/CoBL/static/* ielexStatic/
# Building image:
image="lingdb/nginx"
docker build -t $image:latest .
