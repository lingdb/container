FROM node:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="ielex2_stage0" \
      version="1.2.0" \
      documentation="https://github.com/lingdb/container/wiki/ielex2"

RUN apt-get update \
 && apt-get install -y \
    build-essential \
    postgresql-server-dev-all \
    libxml2 \
    libxml2-dev \
    libxslt-dev \
    pwgen zlib1g-dev \
    python2.7 python2.7-dev \
    python-pip \
    python2.7-lxml \
    vim \
    less \
    git \
 && npm install --global bower \
 && git config --global url."https://".insteadOf git://

COPY configIELex2.sh /
RUN chmod u+x /configIELex2.sh

ENTRYPOINT /configIELex2.sh
