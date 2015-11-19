#!/bin/bash
cd /create
pg="psql -h postgres -U ielexuser"
echo "Recreating database ielexdb201510…"
echo "DROP DATABASE IF EXISTS ielexdb201510; CREATE DATABASE ielexdb201510 WITH OWNER = ielexuser;" | $pg
if [ -f dump.sql ]; then
  echo "Found dump.sql -> inserting…"
  $pg ielexdb201510 < dump.sql
  if [ -f alter.sql ]; then
    echo "Found alter.sql -> inserting…"
    $pg ielexdb201510 < alter.sql
  fi
else
  echo "No dump.sql found -> not inserting one"
fi
