#!/bin/bash
# https://stackoverflow.com/a/246128/448591
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
# Pulling all the base images that the containers build upon.
echo "Getting containers ready…"
containers="mariadb/create mariadb/backup postgres/create postgres/backup sndcomp ielex2 nginx"
for cont in $containers; do
  echo "Now building $cont"
  # https://stackoverflow.com/a/786515/448591
  (cd $cont && ./build.sh)
done
