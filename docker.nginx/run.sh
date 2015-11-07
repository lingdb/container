#!/usr/bin/bash
# http://www.postgresql.org/docs/9.0/static/libpq-envars.html
docker run --link lingdb.sndcomp:sndcomp \
# FIXME    --link lingdb.ielex:ielex \
           -p 127.0.0.1:5000:5000 \
# FIXME     -v `pwd`/sound:/sndcomp/static/sound \
           -it lingdb.sndcomp
