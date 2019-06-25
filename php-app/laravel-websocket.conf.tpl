[supervisord]
nodaemon=true

[program:laravel-websockets]
process_name=%(program_name)s_%(process_num)02d
command=php /var/www/artisan websockets:serve --port=%%PUSHER_APP_PORT%%
autostart=true
autorestart=true
numprocs=1
startretries=10
stdout_events_enabled=1
