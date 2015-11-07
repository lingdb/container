FROM lingdb.ielex2.stage1:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

COPY entrypoint.sh /

RUN chmod u+x /entrypoint.sh

EXPOSE 5000

ENTRYPOINT /entrypoint.sh
