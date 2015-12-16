FROM php:7.0.0-apache

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

LABEL lingdb="sndcomp.php" \
      version="1.0.0" \
      documentation="https://github.com/lingdb/container/wiki/sndcomp.php"

RUN docker-php-ext-install mysqli && \
    a2enmod rewrite

COPY src/ /var/www/html

RUN chmod -R 777 /var/www/html/export/download
