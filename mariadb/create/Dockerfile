FROM mariadb:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="mariadb_create" \
      version="1.2.1" \
      documentation="https://github.com/lingdb/container/wiki/mariadb#the-mariadbcreate-container"

COPY create.sh /create.sh

RUN mkdir /create && \
    chmod u+x /create.sh

ENTRYPOINT /create.sh
