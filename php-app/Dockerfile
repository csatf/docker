FROM benbjurstrom/php:latest

# Install supervisor
RUN apk update && apk add -u python py-pip
RUN pip install supervisor

# Define working directory
WORKDIR /etc/supervisor/conf.d

# Use local supervisor configuration
COPY laravel-horizon.conf.tpl /etc/supervisor/conf.d/laravel-horizon.conf.tpl
COPY laravel-phpfpm.conf.tpl /etc/supervisor/conf.d/laravel-phpfpm.conf.tpl
COPY laravel-queue.conf.tpl /etc/supervisor/conf.d/laravel-queue.conf.tpl
COPY laravel-websocket.conf.tpl /etc/supervisor/conf.d/laravel-websocket.conf.tpl

# Copy scripts
COPY init.sh /usr/local/bin/init.sh
RUN chmod u+x /usr/local/bin/init.sh

# Run init.sh
ENTRYPOINT ["/bin/sh", "/usr/local/bin/init.sh"]
