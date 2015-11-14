FROM nginx:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="nginx" \
      version="1.0.0" \
      documentation="https://github.com/lingdb/container/wiki/nginx"

COPY siteconfig /etc/nginx/conf.d/default.conf
COPY htpasswd /
