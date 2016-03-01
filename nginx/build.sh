#!/bin/bash
# Switching to scripts directory:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Building image:
image="lingdb/nginx"
docker build -t $image:latest .
