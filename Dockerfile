FROM alpine

RUN apk add --no-cache \
            nginx \
            nginx-mod-http-headers-more \
            nginx-mod-http-brotli \
            php81 \
            php81-bcmath \
            php81-ctype \
            php81-curl \
            php81-dom \
            php81-fileinfo \
            php81-fpm \
            php81-gd \
            php81-iconv \
            php81-json \
            php81-ldap \
            php81-mbstring \
            php81-mysqli \
            php81-pdo \
            php81-pdo_mysql \
            php81-pdo_sqlite \
            php81-pecl-redis \
            php81-phar \
            php81-session \
            php81-sodium \
            php81-simplexml \
            php81-sqlite3 \
            php81-tokenizer \
            php81-xml \
            php81-xmlreader \
            php81-xmlwriter \
            ssmtp \
            supervisor && apk del python3
RUN mkdir /srv/http
RUN    install -d -o nginx -g nginx \
            /run/php \
            /var/log/nginx \
            /var/log/php \
            /var/log/supervisor
RUN wget -O - https://getcomposer.org/installer | php -- --filename=composer --install-dir=/usr/bin
RUN crontab -l | { cat; echo "* * * * * /usr/bin/php /srv/http/artisan schedule:run >> /dev/null 2>&1"; } | crontab -
COPY overlay /
WORKDIR /srv/http

EXPOSE 80

CMD ["supervisord", "-n", "-c", "/etc/supervisord.conf"]

