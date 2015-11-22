#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir/..
# Following parts inspired by ../run.sh:
echo "Starting containers…"
(cd mariadb && ./run.sh)
echo "Sleeping 30s to wait for database container to come up…"
sleep 30s
echo "Initializing database container…"
(cd mariadb/create && ./run.sh)
(cd sndcomp && ./run.sh)
(cd nginx.sndcomp && ./run.sh)
