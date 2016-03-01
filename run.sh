#!/bin/bash
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $dir

echo "Starting database containers…"
docker-compose up -d mariadb postgres

echo "Sleeping 30s to wait for database containers to come up…"
sleep 30s

echo "Starting remaining containers…"
docker-compose up -d
