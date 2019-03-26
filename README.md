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
