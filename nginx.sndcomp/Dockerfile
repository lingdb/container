FROM nginx:1.9.7

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="nginx.sndcomp" \
      version="1.0.0" \
      documentation="https://github.com/lingdb/container/wiki/nginx.sndcomp"

# To prevent DNS floods:
# https://serverfault.com/a/345922/138127
RUN echo "options single-request" >> /etc/resolv.conf

# Copying config files:
COPY siteconfig /etc/nginx/conf.d/default.conf
COPY sndcompStatic /sndcompStatic
