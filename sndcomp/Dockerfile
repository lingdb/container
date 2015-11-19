FROM continuumio/anaconda:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="sndcomp" \
      version="1.1.0" \
      documentation="https://github.com/lingdb/container/wiki/sndcomp"

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    libmysqlclient-dev \
    git pwgen && \
    mkdir /sndcomp

COPY soundcomparisons \sndcomp

COPY getSndcomp.sh \
     entrypoint.sh \
     client_secrets.json /

RUN chmod u+x /getSndcomp.sh /entrypoint.sh && \
    sync && \
    /getSndcomp.sh

EXPOSE 5000

ENTRYPOINT /entrypoint.sh
