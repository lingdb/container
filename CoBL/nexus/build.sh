#!/bin/bash
# Loading secrets:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Building image:
echo "Starting build…"
image="lingdb/cobl_nexus"
docker build -t $image:latest .
