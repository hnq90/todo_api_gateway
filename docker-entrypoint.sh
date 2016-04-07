#!/bin/bash
set -e

rm -rf /etc/nginx/api_conf.d/*.conf
cp /conf/nginx.conf /etc/nginx/

CURRENT_ENDPOINT=${API_ENDPOINT:-"go_todo_api"}

if [ $CURRENT_ENDPOINT == "php_todo_api" ]; then
  cp /conf/php_todo_api.conf /etc/nginx/api_conf.d/
else
  cp /conf/go_todo_api.conf /etc/nginx/api_conf.d/
fi

nginx -g "daemon off;"
