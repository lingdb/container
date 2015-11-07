#!/bin/bash
cd /create
echo "Inserting create.sql…"
mysql -hmysql -uroot -p1234 v5 < create.sql
if [ -f dump.sql ]; then
  echo "Found dump.sql -> inserting…"
  mysql -hmysql -uroot -p1234 v5 < dump.sql
else
  echo "No dump.sql found -> not inserting one"
fi
