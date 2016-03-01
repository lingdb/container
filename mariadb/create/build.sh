#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Preparing create.sh.tmp file:
source ../../secrets/secrets.sh
sed -e "s/<SECRET>/$secretMariaDB/g" create.sh > create.sh.tmp
# Building image:
image="lingdb/mariadb_create"
docker build -t $image:latest .
# Cleanup:
rm create.sh.tmp
