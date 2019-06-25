#!/bin/sh

##
# exit if a command returns a non-zero exit code, print the commands and their # args as they are executed, exit if any unbound variables
#
set -e -x -u

##
# Configure supervisor to run php-fpm
#
if [ "$APP_MODE" = "api" ]; then
	cp /etc/supervisor/conf.d/laravel-phpfpm.conf.tpl /etc/supervisor/supervisord.conf

	supervisord --nodaemon --configuration /etc/supervisor/supervisord.conf
fi

##
# Configure supervisor to run php-fpm
#
if [ "$APP_MODE" = "admin" ]; then
	cp /etc/supervisor/conf.d/laravel-phpfpm.conf.tpl /etc/supervisor/supervisord.conf

	supervisord --nodaemon --configuration /etc/supervisor/supervisord.conf
fi

##
# Configure supervisor to run laravel horizon
#
if [ "$APP_MODE" = "horizon" ]; then
		cp /etc/supervisor/conf.d/laravel-horizon.conf.tpl /etc/supervisor/supervisord.conf

	 supervisord --nodaemon --configuration /etc/supervisor/supervisord.conf
fi

##
# Configure supervisor to run a laravel queue worker
#
if [ "$APP_MODE" = "queue" ]; then
	sed -e "s~%%QUEUE_CONNECTION%%~$QUEUE_CONNECTION~" \
		-e "s~%%QUEUE_NAME%%~$QUEUE_NAME~" \
		/etc/supervisor/conf.d/laravel-queue.conf.tpl > /etc/supervisor/supervisord.conf

	 supervisord --nodaemon --configuration /etc/supervisor/supervisord.conf
fi

##
# Configure supervisor to run laravel websockets
#
if [ "$APP_MODE" = "websocket" ]; then
	sed -e "s~%%PUSHER_APP_PORT%%~$PUSHER_APP_PORT~" \
		/etc/supervisor/conf.d/laravel-websocket.conf.tpl > /etc/supervisor/supervisord.conf

	 supervisord --nodaemon --configuration /etc/supervisor/supervisord.conf
fi

##
# Configure a cron job to a run laravel jobs heartbeat every minute
#
if [ "$APP_MODE" = "job" ]; then
	 crond
	 echo '*  *  *  *  * php /var/www/artisan schedule:run >> /dev/null 2>&1' > /etc/crontabs/root
	 tail -f /dev/null
fi

echo "Variable APP_MODE must be one of api, admin, horizon, queue, websocket, or job"
exit 1
