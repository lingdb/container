FROM continuumio/anaconda:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

RUN apt-get install -y \
    build-essential \
    postgresql-server-dev-all \
    libxml2 \
    libxml2-dev \
    libxslt-dev \
    python2.7-lxml \
    pwgen zlib1g-dev

COPY ielex2 /ielex2
COPY configIELex2.sh /
RUN chmod u+x /configIELex2.sh && \
    sync && \
    /configIELex2.sh
