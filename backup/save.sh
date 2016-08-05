#!/bin/bash
# Chdir to file location:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Clenaing docker containers and images:
docker ps -f status=exited -f label=lingdb -q | xargs docker rm
docker images -f dangling=true -f label=lingdb -q | xargs docker rmi
# Creating new backup:
name="$(date -I).images.tar"
echo "Creating $name…"
docker images -f label=lingdb -q | xargs docker save -o $name
# Removing some to keep last 2:
echo "Keeping only 2 latest backups…"
ls -tr *tar | head -n -2 | xargs --no-run-if-empty rm
