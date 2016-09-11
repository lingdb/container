#!/bin/bash
# Chdir to file location:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Removing current backups
rm *.images.tar
# Clenaing docker containers and images:
docker ps -f status=exited -f label=lingdb -q | xargs docker rm
docker images -f dangling=true -f label=lingdb -q | xargs docker rmi
# Creating new backup:
name="$(date -I).images.tar"
echo "Creating $name…"
docker images -f label=lingdb -q | xargs docker save -o $name
