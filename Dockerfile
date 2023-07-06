FROM php:7.4-cli
WORKDIR /repo
COPY . .

RUN apt update
RUN apt install git unzip -y
RUN curl -sS https://getcomposer.org/installer | php
RUN php composer.phar self-update 2.1.12
RUN php composer.phar --working-dir=picocms install
# RUN cd picocms/
CMD ["cd", "picocms/", "&&", "php", "-S", "0.0.0.0:5002"]