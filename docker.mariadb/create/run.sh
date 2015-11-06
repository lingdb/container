#!/usr/bin/bash
docker run --link container.mariadb:mysql \
           -v `pwd`:/create \
           -it docker.mariadb.create /create.sh
