FROM php:5.6.16-apache

MAINTAINER Jakob Runge <mam09crm@studserv.uni-leipzig.de>

# FIXME add documentation!
LABEL lingdb="sndcomp.php" version="1.0.0"

RUN docker-php-ext-install mysqli && \
    a2enmod rewrite

COPY src/ /var/www/html

RUN chmod -R 777 /var/www/html/export/download
