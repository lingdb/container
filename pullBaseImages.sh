#!/bin/bash
# Pulling all the base images that the containers build upon.
images="continuumio/anaconda:latest ubuntu:latest mariadb:latest nginx:latest postgres:9.3.10 crosbymichael/skydns:latest crosbymichael/skydock:latest"
echo "Pulling base images:"
for image in $images; do
  echo "Pulling image: $image"
  docker pull $image
done
