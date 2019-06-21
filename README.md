# Docker
Repository housing various Dockerfiles

## benbjurstrom/php
From php:7-fpm-alpine with:
- Composer
- PDO Pgsql
- GD
- Opcache

## benbjurstrom/php-xdebug
From benbjurstrom/php with:
- Xdebug

## benbjurstrom/php-queue
From benbjurstrom/php with:
- Supervisor
- Laravel Horizon supervisord
- Laravel schedule heartbeat

# benbjurstrom/php-app
From benbjurstrom/php with:
- Laravel Jobs heartbeat
- Supervisor control for:
  - Phpfpm
  - Laravel Horizon
  - Laravel Queue Worker
  - Laravel Websockets

Set $APP_MODE to one phpfpm, horizon, queue, websocket, or job.
