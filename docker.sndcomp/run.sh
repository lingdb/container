#!/usr/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
docker run --link lingdb.mariadb:mysql \
           -p 127.0.0.1:5000:5000 \
           -it lingdb.sndcomp
