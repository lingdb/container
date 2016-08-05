#!/bin/bash
# https://stackoverflow.com/a/246128/448591
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir

services='nginx postgres_backup mariadb_backup'

./withCompose.sh up -d $services
