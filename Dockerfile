FROM alpine:3.20

RUN apk add --no-cache \
            nginx \
            nginx-mod-http-headers-more \
            nginx-mod-http-brotli \
            php82 \
            php82-bcmath \
            php82-ctype \
            php82-curl \
            php82-dom \
            php82-fileinfo \
            php82-fpm \
            php82-gd \
            php82-iconv \
            php82-json \
            php82-ldap \
            php82-mbstring \
            php82-mysqli \
            php82-pdo \
            php82-pdo_mysql \
            php82-pdo_sqlite \
            php82-pecl-redis \
            php82-phar \
            php82-session \
            php82-sodium \
            php82-simplexml \
            php82-sqlite3 \
            php82-tokenizer \
            php82-xml \
            php82-xmlreader \
            php82-xmlwriter \
            ssmtp
RUN mkdir /srv/http
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'dac665fdc30fdd8ec78b38b9800061b4150413ff2e3b6f88543c636f7cd84f6db9189d43a81e5503cda447da73c7e5b6') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" && \
    php composer-setup.php --install-dir /usr/bin && \
    php -r "unlink('composer-setup.php');"
    
COPY overlay /
WORKDIR /srv/http
EXPOSE 80
ENTRYPOINT ["/entrypoint.sh"]

