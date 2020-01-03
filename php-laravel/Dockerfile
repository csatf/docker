FROM csatf/php-ambientum:latest

RUN composer global require laravel/vapor-cli

# Copy scripts
COPY init.sh /scripts/init.sh
RUN sudo chmod +x /scripts/init.sh

# Run init.sh
ENTRYPOINT ["/bin/sh", "/scripts/init.sh"]
