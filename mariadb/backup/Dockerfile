FROM ubuntu:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="mariadb/backup" \
      version="1.0.0" \
      documentation="https://github.com/lingdb/container/wiki/mariadb#the-mariadbbackup-container"

COPY dumpdb.sh /

RUN apt-get install -y mysql-client && \
    mkdir /backup && \
    chmod u+x /dumpdb.sh

ENTRYPOINT /dumpdb.sh
