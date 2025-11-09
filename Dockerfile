FROM php:8.4-apache

# activate Apache mod_rewrite
RUN a2enmod rewrite

# install Composer
COPY --from=composer/composer:latest /usr/bin/composer /usr/bin/composer

# set my own Apache site
# and set DocumentRoot to /var/www/html/public
COPY my-site.conf /etc/apache2/sites-available/000-default.conf

# set owner
RUN chown -R www-data:www-data /var/www/html
# RUN chown -R www-data:www-data /var/www/html/bootstrap
# RUN chown -R www-data:www-data /var/www/html/storage

RUN mkdir /var/www/html/public
# COPY ./src/* /var/www/html/
