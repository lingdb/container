#!/bin/bash
# https://stackoverflow.com/a/246128/448591
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir
(./pull.sh)
# Building containers…
echo "docker-compose build…"
docker-compose build
echo "Running custom builds…"
containers="mariadb/create postgres/create sndcomp.php CoBL"
for cont in $containers; do
  echo "Now building $cont"
  # https://stackoverflow.com/a/786515/448591
  (cd $cont && ./build.sh)
done
