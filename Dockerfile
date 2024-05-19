
FROM php:7.4.0-fpm
WORKDIR /var/www/html
RUN apt-get update && apt-get install -y \
    unzip \
    && docker-php-ext-install filter

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
COPY . /var/www/html
RUN composer install --ignore-platform-req=ext-filter
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html
