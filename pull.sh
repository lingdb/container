#!/bin/bash
# Pulling all the base images that the containers build upon.
images="debian:jessie ubuntu:14.04.3 mariadb:latest nginx:1.9.7 postgres:9.3.10 php:7.0.0-apache"
echo "Pulling base images:"
for image in $images; do
  echo "Pulling image: $image"
  docker pull $image
done
