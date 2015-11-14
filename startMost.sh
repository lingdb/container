#!/bin/bash
# Starting most containers…
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir

echo "Starting docker dns setup…"
(cd dns && ./run.sh)

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
(cd nginx && ./run.sh)
