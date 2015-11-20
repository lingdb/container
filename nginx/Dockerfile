FROM nginx:1.9.7

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="nginx" \
      version="1.1.1" \
      documentation="https://github.com/lingdb/container/wiki/nginx"

# To prevent DNS floods:
# https://serverfault.com/a/345922/138127
RUN echo "options single-request" >> /etc/resolv.conf

# Copying config files:
COPY siteconfig /etc/nginx/conf.d/default.conf
COPY htpasswd /
COPY ielexStatic /ielexStatic
COPY sndcompStatic /sndcompStatic
