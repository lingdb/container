FROM ubuntu:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

RUN apt-get install -y mysql-client && \
    mkdir /backup

COPY dumpdb.sh /
