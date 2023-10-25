FROM php:8.1-apache
RUN a2enmod rewrite setenvif session ssl
#base php functionality
RUN docker-php-ext-install mysqli; docker-php-ext-enable mysqli && apt update
#cron
RUN apt install -y cron && apt install -y nano
COPY crontab /etc/cron.d/crontab
RUN chmod 0644 /etc/cron.d/crontab; crontab /etc/cron.d/crontab
CMD ["cron", "-f"]