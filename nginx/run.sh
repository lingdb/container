#!/bin/bash
image="lingdb/nginx"
name="lingdb_nginx_$(date -I)_$(pwgen 5 1)"
dns=$(ip -f inet -o addr show docker0|cut -d\  -f 7 | cut -d/ -f 1)
docker run -p 0.0.0.0:80:80 \
           --name $name \
           --dns="$dns" \
           -d $image
