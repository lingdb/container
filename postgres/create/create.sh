#!/bin/bash
cd /create
pg="psql -h postgres -U ielexuser"
echo "Recreating datanase ielexdb201510…"
echo "DROP DATABASE IF EXISTS ielexdb201510;" | $pg
echo "CREATE DATABASE ielexdb201510 WITH OWNER = ielexuser;" | $pg
if [ -f dump.sql ]; then
  echo "Found dump.sql -> inserting…"
  $pg ielexdb201510 < dump.sql
else
  echo "No dump.sql found -> not inserting one"
fi
