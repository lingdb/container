FROM continuumio/anaconda:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

COPY configIELex2.sh /

RUN apt-get install -y \
    build-essential \
    postgresql-server-dev-all \
    libxml2 \
    libxml2-dev \
    libxslt-dev \
    python2.7-lxml \
    pwgen zlib1g-dev && \
    mkdir /ielex2 && \
    chmod u+x /config/IELex2.sh

COPY ielex2 /ielex2

#RUN configIELex2.sh /
