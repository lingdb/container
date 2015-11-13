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

# This appears to be helpful for testing and stuff
# Also the pip install wasn't given in REQUIREMENTS
# State 2015-11-12
RUN pip install \
    WTForms-SQLAlchemy \
    WTForms \
    django_tables2 \
    wtforms_components && \
    apt-get install -y vim less

COPY ielex2 /ielex2
COPY configIELex2.sh /
RUN chmod u+x /configIELex2.sh && \
    sync && \
    /configIELex2.sh
