#!/bin/bash
image="lingdb/cobl_stage2"
tag=$(grep version Dockerfile | grep -Po "\"[^\"]+\"" | sed -e "s/\"//g")
docker build -t $image:$tag .
docker tag -f $image:$tag $image:latest
