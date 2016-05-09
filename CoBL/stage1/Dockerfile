FROM node:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="cobl_stage0" \
      version="1.4.0" \
      documentation="https://github.com/lingdb/container/wiki/cobl"

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
 && npm install --global bower grunt-cli \
 && git config --global url."https://".insteadOf git://

# Installing pip dependencies:
COPY CoBL/REQUIREMENTS /REQUIREMENTS
RUN pip install -r /REQUIREMENTS \
 && rm /REQUIREMENTS

COPY configIELex2.sh /
RUN chmod u+x /configIELex2.sh

ENTRYPOINT /configIELex2.sh
