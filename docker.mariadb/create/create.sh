#!/bin/bash
cd /create
mysql -hmysql -uroot -p1234 v5 < create.sql
mysql -hmysql -uroot -p1234 v5 < dump.sql
