FROM ubuntu:14.04.3

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="mariadb_backup" \
      version="1.1.0" \
      documentation="https://github.com/lingdb/container/wiki/mariadb#the-mariadbbackup-container"

COPY dumpdb.sh.tmp /dumpdb.sh

RUN apt-get install -y mysql-client && \
    mkdir /backup && \
    chmod u+x /dumpdb.sh

ENTRYPOINT /dumpdb.sh
