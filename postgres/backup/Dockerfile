FROM ubuntu:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

COPY backup.sh /

RUN apt-get install -y postgresql-client && \
    mkdir /backup && \
    chmod u+x /backup.sh

ENTRYPOINT /backup.sh
