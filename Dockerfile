FROM php:7.0-apache
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install postgresql -y
copy src/ /var/www/html
copy app.host /etc/apache2/sites-enabled/000-default.conf

EXPOSE 80
