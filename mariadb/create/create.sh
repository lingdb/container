#!/bin/bash
cd /create
echo "Inserting create.sql…"
mysql -hmysql -uroot -p$MYSQL_ROOT_PASSWORD v4 < create.sql
if [ -f dump.sql ]; then
  echo "Found dump.sql -> inserting…"
  mysql -hmysql -uroot -p$MYSQL_ROOT_PASSWORD v4 < dump.sql
else
  echo "No dump.sql found -> not inserting one"
fi
