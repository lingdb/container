FROM lingdb/cobl_stage1:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="cobl_stage2" \
      version="1.1.0" \
      documentation="https://github.com/lingdb/container/wiki/cobl#the-coblstage2-setup"

COPY entrypoint.sh /

RUN chmod u+x /entrypoint.sh

EXPOSE 5000

ENTRYPOINT /entrypoint.sh
