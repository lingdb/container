#!/bin/bash
image="lingdb/ielex2_stage2"
tag=$(date -I | sed -e 's/-/./g')
docker build -t $image:$tag .
docker tag -f $image:$tag $image:latest
