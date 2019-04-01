FROM benbjurstrom/php:latest

ENV QUEUE_CONNECTION=redis
ENV QUEUE_NAME=default

# Install supervisor
RUN apk update && apk add -u python py-pip
RUN pip install supervisor

# Define working directory
WORKDIR /etc/supervisor/conf.d

# Use local configuration
COPY laravel-worker.conf.tpl /etc/supervisor/conf.d/laravel-worker.conf.tpl
COPY laravel-horizon.conf.tpl /etc/supervisor/conf.d/laravel-horizon.conf.tpl

# Copy scripts
COPY init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh

# Add schedule command to crontab
RUN echo '*  *  *  *  * php /var/www/artisan schedule:run >> /dev/null 2>&1' > /etc/crontabs/root

# Run supervisor
ENTRYPOINT ["/bin/sh", "/usr/local/bin/init.sh"]
