
FROM php:8.1-fpm
WORKDIR /var/www/html
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd
COPY . /var/www/html
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html