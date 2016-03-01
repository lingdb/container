#!/bin/bash
# Making sure we're at the right place:
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir/..
# Loading secrets:
source ./secrets/secrets.sh
# Recurse one level:
docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v `pwd`:/container \
  -e MYSQL_ROOT_PASSWORD=$secretMariaDB \
  -e POSTGRES_PASSWORD=$secretPostgreSQL \
  -e DOCKER_BASE=`pwd` \
  --privileged=true \
  -it lingdb/dockerception $@
