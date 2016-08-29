FROM node:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="cobl" \
      version="1.5.0" \
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

# Installing {npm,bower} dependencies:
COPY CoBL/static /build_static
WORKDIR /build_static
RUN npm install \
 && bower install --allow-root ./bower.json \
 && grunt

# Readying CoBL directory:
COPY CoBL /CoBL
RUN rm -rf /CoBL/static \
 && mv /build_static /CoBL/static

# Creating copyStatic:
RUN mkdir /copyStatic

# Getting ready to run:
WORKDIR /CoBL
EXPOSE 5000
COPY entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
ENTRYPOINT /entrypoint.sh
