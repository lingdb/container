#!/bin/sh
# This is a short script to provide postgres from localhost.
target=$(docker ps -f label=lingdb=postgres -n=1 -f status=running -q)
ip=$(docker exec $target hostname -i)
socat -d -d tcp-listen:5432,bind=localhost,reuseaddr,fork tcp:$ip:5432
