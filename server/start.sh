#!/bin/sh
/usr/local/sbin/sshd
php-fpm
memcached -d -u nobody -p 11211 -m 4 -c 512 -P /var/run/memcached.pid
nginx
redis-server /etc/redis.conf
