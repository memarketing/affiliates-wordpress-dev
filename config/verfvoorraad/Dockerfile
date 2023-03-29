FROM wordpress:6.1-apache

RUN a2enmod ssl
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod substitute

COPY security.ini $PHP_INI_DIR/conf.d/