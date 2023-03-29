FROM wordpress:6.1-apache

ADD plugins /var/www/html/wp-content/plugins
ADD themes /var/www/html/wp-content/themes
ADD .htaccess /var/www/html/.htaccess

COPY security.ini $PHP_INI_DIR/conf.d/
