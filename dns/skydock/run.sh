#!/bin/bash
domain="docker0"
name="skydock.$domain"
skydns="skydns.$domain"
image="crosbymichael/skydock"
env="lingdb"
docker run -d -v /var/run/docker.sock:/docker.sock --name $name $image -ttl 30 -environment $env -s /docker.sock -domain $domain -name $skydns
