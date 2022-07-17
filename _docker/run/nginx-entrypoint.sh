#!/bin/sh

sed -i "s/server_name.*/server_name $HOST_URL www.$HOST_URL;/g" /etc/nginx/conf.d/default.conf
# sed -i "s/return 301 https:\/\/www.*/return 301 https:\/\/www.$HOST_URL\$request_uri;/g" /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'