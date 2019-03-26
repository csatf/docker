FROM local-php:latest

ENV PYTHON_VERSION=2.7.15-r1
ENV PY_PIP_VERSION=10.0.1-r0
ENV SUPERVISOR_VERSION=3.3.3

ENV QUEUE_CONNECTION=redis
ENV QUEUE_NAME=default
ENV LARAVEL_HORIZON=true

RUN docker-php-ext-install pcntl

# Install supervisor
RUN apk update && apk add -u python=$PYTHON_VERSION py-pip=$PY_PIP_VERSION
RUN pip install supervisor==$SUPERVISOR_VERSION

# Define working directory
WORKDIR /etc/supervisor/conf.d

# Use local configuration
COPY laravel-worker.conf.tpl /etc/supervisor/conf.d/laravel-worker.conf.tpl
COPY laravel-horizon.conf.tpl /etc/supervisor/conf.d/laravel-horizon.conf.tpl

# Copy scripts
COPY init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh

# Add schedule command to crontab
RUN echo '*  *  *  *  * php /var/www/app/artisan schedule:run >> /dev/null 2>&1' > /etc/crontabs/root
