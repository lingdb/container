#!/bin/bash
# Pulling all the base images that the containers build upon.
images="continuumio/anaconda:latest mariadb:latest nginx:latest postgres:9.3.10 ubuntu:latest"
echo "Pulling base images:"
for image in $images; do
  echo "Pulling image: $image"
  docker pull $image
done
