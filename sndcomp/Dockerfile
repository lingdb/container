FROM debian:jessie

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="sndcomp" \
      version="1.3.0" \
      documentation="https://github.com/lingdb/container/wiki/sndcomp"

RUN apt-get update \
 && apt-get install -y \
    build-essential \
    libmysqlclient-dev \
    git pwgen \
    python2.7 python2.7-dev \
    python-pip \
 && mkdir /sndcomp

COPY soundcomparisons \sndcomp

COPY getSndcomp.sh.tmp \
     entrypoint.sh \
     client_secrets.json /

RUN mv /getSndcomp.sh.tmp /getSndcomp.sh \
 && sync \
 && chmod u+x /getSndcomp.sh /entrypoint.sh \
 && sync \
 && /getSndcomp.sh \
 && python2 /sndcomp/setup.py install

EXPOSE 5000

ENTRYPOINT /entrypoint.sh
