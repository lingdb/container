FROM ubuntu:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="postgres/backup" \
      version="1.0.0" \
      documentation="https://github.com/lingdb/container/wiki/postgres#the-postgresbackup-container"

COPY backup.sh /

RUN apt-get install -y postgresql-client && \
    mkdir /backup && \
    chmod u+x /backup.sh

ENTRYPOINT /backup.sh
