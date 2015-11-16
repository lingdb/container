#!/bin/bash
dns=$(ip -f inet -o addr show docker0|cut -d\  -f 7 | cut -d/ -f 1)
sed "s/<+RESOLVER+>/$dns/g" siteconfig > siteconfig.tmp
image="lingdb/nginx"
tag=$(date -I | sed -e 's/-/./g')
docker build -t $image:$tag .
docker tag -f $image:$tag $image:latest
rm siteconfig.tmp
