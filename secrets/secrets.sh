#!/bin/bash
# This script initializes and sources the secrets file.
# https://github.com/lingdb/container/issues/6
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
file="$dir/secrets"
if [ ! -f $file ]; then
  echo "Creating '$file', because they're missing…"
  touch $file
  echo "secretMariaDB=\"$(pwgen 16 1)\"" >> $file
  echo "secretPostgreSQL=\"$(pwgen 16 1)\"" >> $file
  echo "djangoSecret=\"$(pwgen 32 1)\"" >> $file
fi
source $file
