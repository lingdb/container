FROM lingdb/ielex2_stage1:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="ielex_stage2" \
      version="1.0.1" \
      documentation="https://github.com/lingdb/container/wiki/ielex2#the-ielex2stage2-setup"

COPY entrypoint.sh /

RUN chmod u+x /entrypoint.sh

EXPOSE 5000

ENTRYPOINT /entrypoint.sh
