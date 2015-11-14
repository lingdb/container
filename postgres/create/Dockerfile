FROM ubuntu:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="postgres/create" \
      version="1.0.0" \
      documentation="https://github.com/lingdb/container/wiki/postgres#the-postgrescreate-container"

COPY create.sh /

RUN apt-get install -y postgresql-client && \
    mkdir /create && \
    chmod u+x /create.sh

ENTRYPOINT /create.sh
