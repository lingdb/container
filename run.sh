#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir

echo "Starting database containers…"
(cd mariadb && ./run.sh)
(cd postgres && ./run.sh)

echo "Sleeping 30s to wait for database containers to come up…"
sleep 30s

echo "Initializing database containers…"
(cd mariadb/create && ./run.sh)
(cd postgres/create && ./run.sh)

echo "Starting backup containers…"
(cd mariadb/backup && ./run.sh)
(cd postgres/backup && ./run.sh)

echo "Starting web apps…"
(cd sndcomp && ./run.sh)
(cd ielex2 && ./run.sh)
(cd nginx && ./run.sh)
