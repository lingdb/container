#!/bin/bash
# This script initializes and sources the secrets file.
# https://github.com/lingdb/container/issues/6
file="secrets"
if [ ! -f $file ]; then
  echo "Creating '$file', because they're missing…"
  touch $file
  echo "secretMariaDB=\"$(pwgen 16 1)\"" >> $file
  echo "secretPostgreSQL=\"$(pwgen 16 1)\"" >> $file
fi
source $file
