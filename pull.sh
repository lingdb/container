#!/bin/bash
# Pulling all the base images that the containers build upon.
images="debian:jessie mariadb:latest nginx:1.9.7 alpine:latest php:7-apache postgres:9.3.10"
echo "Pulling base images:"
for image in $images; do
  echo "Pulling image: $image"
  docker pull $image
done
