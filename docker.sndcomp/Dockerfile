FROM continuumio/anaconda:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

RUN apt-get install -y \
    build-essential \
    libmysqlclient-dev \
    git pwgen && \
    mkdir /sndcomp

COPY getSndcomp.sh /
COPY entrypoint.sh /
COPY client_secrets.json /
RUN chmod u+x /getSndcomp.sh && \
    chmod u+x /entrypoint.sh && \
    /getSndcomp.sh

EXPOSE 5000

ENTRYPOINT /entrypoint.sh
