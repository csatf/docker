FROM benbjurstrom/php-app:latest

RUN apk --update --no-cache add autoconf g++ make && \
    pecl install -f xdebug && \
    docker-php-ext-enable xdebug && \
    apk del --purge autoconf g++ make

# Install phpunit.phar for faster code coverage
RUN wget https://phar.phpunit.de/phpunit-8.2.phar
RUN chmod +x phpunit-8.2.phar
RUN mv phpunit-8.2.phar /usr/local/bin/phpunit

COPY xdebug.ini /usr/local/etc/php/conf.d/
