#!/bin/bash
# Pulling all the base images that the containers build upon.
images="continuumio/anaconda:latest ubuntu:14.04.3 mariadb:latest nginx:1.9.7 postgres:9.3.10 php:7.0.0-apache"
echo "Pulling base images:"
for image in $images; do
  echo "Pulling image: $image"
  docker pull $image
done
# https://stackoverflow.com/a/246128/448591
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Building containers…
echo "Getting containers ready…"
containers="mariadb/create mariadb/backup postgres/create postgres/backup sndcomp sndcomp.php ielex2 nginx nginx.sndcomp"
for cont in $containers; do
  echo "Now building $cont"
  # https://stackoverflow.com/a/786515/448591
  (cd $cont && ./build.sh)
done
