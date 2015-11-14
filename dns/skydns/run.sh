#!/bin/bash
domain="docker0"
name="skydns.$domain"
image="crosbymichael/skydns"
fallback="8.8.8.8:53"
network="172.17.0.1:53:53/udp"
docker run -d -p $network --name $name $image -nameserver $fallback -domain $domain
