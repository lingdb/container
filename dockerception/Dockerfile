FROM runjak/dockerception:latest

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL version="1.0.0" \
      documentation="https://github.com/runjak/dockerception"

RUN apk update \
 && apk upgrade \
 && apk add bash \
 && rm /var/cache/apk/APKINDEX*tar.gz \
 && mkdir /container

ENTRYPOINT ["/bin/bash"]

WORKDIR /container
