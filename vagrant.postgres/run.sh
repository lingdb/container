#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir/..
# Following parts inspired by ../run.sh:
echo "Starting database containers…"
(cd postgres && ./run.sh vagrant)
echo "Sleeping 30s to wait for database containers to come up…"
sleep 30s
(cd postgres/create && ./run.sh)
