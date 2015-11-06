#!/usr/bin/bash
docker run --link lingdb.mariadb:mysql \
           -v `pwd`:/create \
           -it lingdb.mariadb.create /create.sh
