FROM nginx:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="nginx" \
      version="1.0.0" \
      documentation="https://github.com/lingdb/container/wiki/nginx"

# To prevent DNS floods:
# https://serverfault.com/a/345922/138127
RUN echo "options single-request" >> /etc/resolv.conf

# Copying config files:
COPY siteconfig.tmp /etc/nginx/conf.d/default.conf
COPY htpasswd /
