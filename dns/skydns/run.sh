#!/bin/bash
domain="docker0"
name="skydns.$domain"
image="crosbymichael/skydns"
fallback="8.8.8.8:53,8.8.4.4:53"
dockerHostIp=$(ip -f inet -o addr show docker0|cut -d\  -f 7 | cut -d/ -f 1)
network="$dockerHostIp:53:53/udp"
docker run -d -p $network --name $name $image -nameserver $fallback -domain $domain
