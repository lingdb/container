#!/bin/bash
# https://stackoverflow.com/a/246128/448591
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Creating /tmp/ielexStatic if necessary:
if [ ! -d /tmp/ielexStatic ]; then
  mkdir /tmp/ielexStatic
fi
# Running compose…
source secrets/secrets.sh
env DOCKER_BASE=`pwd`\
    MYSQL_ROOT_PASSWORD=$secretMariaDB\
    POSTGRES_PASSWORD=$secretPostgreSQL\
    DJANGO_SECRET=$djangoSecret\
    docker-compose $@
