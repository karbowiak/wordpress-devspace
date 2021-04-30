#!/bin/bash

mkdir -p /run/php #This has to be done because it apparently doesn't exist ?!!?
/usr/sbin/php-fpm8.0 -R -F -c /etc/php/8.0/fpm/php-fpm.conf