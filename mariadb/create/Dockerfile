FROM mariadb:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="mariadb_create" \
      version="1.2.0" \
      documentation="https://github.com/lingdb/container/wiki/mariadb#the-mariadbcreate-container"

COPY create.sh.tmp /create.sh

RUN mkdir /create && \
    chmod u+x /create.sh

ENTRYPOINT /create.sh
