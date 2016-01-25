FROM postgres:9.3.10

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="postgres_create" \
      version="1.1.1" \
      documentation="https://github.com/lingdb/container/wiki/postgres#the-postgrescreate-container"

COPY create.sh /

RUN mkdir /create && \
    chmod u+x /create.sh

ENTRYPOINT /create.sh
