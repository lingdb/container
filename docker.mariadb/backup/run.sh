#!/usr/bin/bash
docker run --link container.mariadb:mysql \
           -v `pwd`:/backup \
           -it docker.mariadb.backup /dumpdb.sh
