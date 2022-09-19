FROM existenz/webstack:7.4

RUN apk add vim git php-session php-json php-mysqli

WORKDIR /www/
RUN rm -rf *

RUN git clone https://github.com/PasserDreamer/HESK-docker-TW.git .

RUN echo "extension=mysqli" >> /etc/php7/php.ini
RUN echo "extension=json" >> /etc/php7/php.ini

RUN chmod 666 hesk/hesk_settings.inc.php
RUN chmod 777 hesk/attachments
RUN chmod 777 hesk/cache
RUN chown php:php hesk/install

RUN sed -i 's@/www/public@/www/hesk@g' /etc/nginx/nginx.conf
