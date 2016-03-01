#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Preparing dumpdb.sh.tmp file:
source ../../secrets/secrets.sh
sed -e "s/<SECRET>/$secretMariaDB/g" dumpdb.sh > dumpdb.sh.tmp
# Building image:
image="lingdb/mariadb_backup"
docker build -t $image:latest .
# Cleanup:
rm dumpdb.sh.tmp
