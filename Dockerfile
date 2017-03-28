FROM php:7.0-apache
FROM php:7.0-cli
FROM php:7.0-fpm
RUN buildDeps="libpq-dev libzip-dev libicu-dev" && \
    apt-get update && \
    apt-get install -y $buildDeps --no-install-recommends && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-install \
        pdo \
        pdo_pgsql \
        pgsql \
        sockets \
        intl
copy src/ /var/www/html
copy app.host /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80
