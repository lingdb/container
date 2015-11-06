#!/usr/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
docker run --link lingdb.postgres:postgres \
           -v `pwd`:/backup \
           -e PGPASSWORD=abcd1234 \
           -it lingdb.postgres.backup /backup.sh
