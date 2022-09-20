FROM existenz/webstack:7.4

RUN apk add vim git php-session php-json php-mysqli

WORKDIR /www/
RUN rm -rf *

RUN git clone https://github.com/PasserDreamer/HESK-docker-TW.git .

RUN chown -R nginx:nginx hesk
RUN chmod 666 hesk/hesk_settings.inc.php
RUN chmod 777 hesk/attachments
RUN chmod 777 hesk/cache

RUN sed -i 's@/www/public@/www/hesk@g' /etc/nginx/nginx.conf
RUN sed -i 's@user = php@user = nginx@g' /etc/php7/php-fpm.conf
RUN sed -i 's@group = php@group = nginx@g' /etc/php7/php-fpm.conf
