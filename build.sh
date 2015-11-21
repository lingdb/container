#!/bin/bash
# Pulling all the base images that the containers build upon.
images="continuumio/anaconda:latest ubuntu:latest mariadb:latest nginx:latest postgres:9.3.10"
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
containers="mariadb/create mariadb/backup postgres/create postgres/backup sndcomp ielex2 nginx"
for cont in $containers; do
  echo "Now building $cont"
  # https://stackoverflow.com/a/786515/448591
  (cd $cont && ./build.sh)
done
