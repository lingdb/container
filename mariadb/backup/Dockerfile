FROM ubuntu:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

COPY dumpdb.sh /

RUN apt-get install -y mysql-client && \
    mkdir /backup && \
    chmod u+x /dumpdb.sh

ENTRYPOINT /dumpdb.sh
