FROM benbjurstrom/php-app:latest

RUN apk --update --no-cache add autoconf g++ make && \
    pecl install -f xdebug && \
    docker-php-ext-enable xdebug && \
    apk del --purge autoconf g++ make

COPY xdebug.ini /usr/local/etc/php/conf.d/
