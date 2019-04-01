[supervisord]
nodaemon=true

[program:php-fpm]
command=php-fpm -F
autostart=true
autorestart=true
priority=5
stdout_events_enabled=true
stderr_events_enabled=true

[program:laravel-horizon]
process_name=%(program_name)s_%(process_num)02d
command=php /var/www/artisan horizon
autostart=true
autorestart=true
numprocs=1
startretries=10
stdout_events_enabled=1
