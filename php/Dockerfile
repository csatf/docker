FROM php:7-fpm-alpine

RUN apk update && apk add curl && \
  curl -sS https://getcomposer.org/installer | php \
  && chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

RUN apk add --no-cache --virtual .build-deps \
        libjpeg-turbo-dev \
        libpng-dev \
        libzip-dev \
        postgresql-dev \
        git

RUN docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr
RUN docker-php-ext-install \
  bcmath \
  gd \
  pcntl \
  pdo_pgsql \
  opcache \
  zip

COPY opcache.ini /usr/local/etc/php/conf.d/
COPY custom.ini /usr/local/etc/php/conf.d/

COPY .bash_aliases /root/.bash_aliases

##
# Identify and relocate shared libraries before deleting .build-deps
# - https://github.com/docker-library/wordpress/blob/master/php7.3/fpm-alpine
#

RUN runDeps="$( \
	scanelf --needed --nobanner --format '%n#p' --recursive /usr/local/lib/php/extensions \
		| tr ',' '\n' \
		| sort -u \
		| awk 'system("[ -e /usr/local/lib/" $1 " ]") == 0 { next } { print "so:" $1 }' \
)"; \
apk add --virtual .phpexts-rundeps $runDeps; \
apk del .build-deps
