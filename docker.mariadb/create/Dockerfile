FROM ubuntu:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

COPY create.sh /

RUN apt-get install -y mysql-client && \
    mkdir /create && \
    chmod u+x /create.sh

ENTRYPOINT /create.sh
