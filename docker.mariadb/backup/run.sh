#!/usr/bin/bash
docker run --link lingdb.mariadb:mysql \
           -v `pwd`:/backup \
           -it lingdb.mariadb.backup /dumpdb.sh
