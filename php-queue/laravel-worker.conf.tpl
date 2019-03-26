[supervisord]
nodaemon=true
loglevel=debug

[program:laravel-worker]
process_name=%(program_name)s_%(process_num)02d
command=php /var/www/app/artisan queue:work %%QUEUE_CONNECTION%% --queue=%%QUEUE_NAME%% --sleep=3 --tries=3
autostart=true
autorestart=true
numprocs=1
startretries=10
stdout_events_enabled=1
stdout_logfile=/var/www/app/storage/logs/worker.log
