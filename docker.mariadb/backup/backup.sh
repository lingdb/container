#!/usr/bin/bash
docker run --link container.mariadb:mysql \
           -v `pwd`:/backup \
           -it $1 /dumpdb.sh
