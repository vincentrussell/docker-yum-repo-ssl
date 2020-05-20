#!/bin/bash

if [[ -f /cert/cert.pem && -f /cert/cert.key  ]]; then
    if [[ -f /etc/nginx/nginx-ssl.conf ]]; then
      echo "replace nginx.conf with nginx-ssl.conf"
      rm -f /etc/nginx/nginx.conf
      mv /etc/nginx/nginx-ssl.conf /etc/nginx/nginx.conf
    fi
else
    echo "could not find /cert/cert.pem and /cert/cert.key so using regular nginx.conf"
fi

if [[ -d "/logs/repo-scanner" ]]; then
   echo "deleting /logs/repo-scanner"
   rm -rf /logs/repo-scanner
fi

if [[ -d "/logs/nginx" ]]; then
  echo "deleting /logs/nginx"
   rm -rf /logs/nginx
fi

if [[ -d "/logs/supervisord" ]]; then
    echo "deleting /logs/supervisord"
   rm -rf /logs/supervisord
fi

if [[ -f "/run/supervisord.pid" ]]; then
    echo "deleting /run/supervisord.pid"
   rm -rf /run/supervisord.pid
fi

exec /root/entrypoint.sh
