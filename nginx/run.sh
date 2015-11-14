#!/bin/bash
image="lingdb/nginx"
name="lingdb_nginx_$(date -I)_$(pwgen 5 1)"
dns="172.17.0.1"
docker run -p 0.0.0.0:80:80 \
           --name $name \
           --dns="$dns" \
           -d $image
