#!/bin/sh
git pull
git submodule update --recursive
./withCompose.sh build cobl
./withCompose.sh build cobl_nexus
./withCompose.sh build sndcomp
./withCompose.sh up -d nginx
./withCompose.sh up -d cobl_nexus
# Clenaing docker containers and images:
docker ps -f status=exited -f label=lingdb -q | xargs --no-run-if-empty docker rm
docker images -f dangling=true -f label=lingdb -q | xargs --no-run-if-empty docker rmi
# Backup disabled because of disk space
# (cd backup; ./save.sh)
