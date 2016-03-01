#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Building image:
image="lingdb/mariadb"
docker build -t $image:latest .
