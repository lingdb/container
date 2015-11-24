#!/bin/bash
secret="<SECRET>"
cd /create
echo "Inserting create.sql…"
mysql -hmysql -uroot -p$secret v5 < create.sql
if [ -f dump.sql ]; then
  echo "Found dump.sql -> inserting…"
  mysql -hmysql -uroot -p$secret v5 < dump.sql
else
  echo "No dump.sql found -> not inserting one"
fi
