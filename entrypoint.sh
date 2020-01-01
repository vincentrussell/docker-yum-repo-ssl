#!/bin/bash

if [[ -f /cert/cert.pem && -f /cert/cert.key ]]; then
    echo "replace nginx.conf with nginx-ssl.conf"
    rm -f /etc/nginx/nginx.conf
    mv /etc/nginx/nginx-ssl.conf /etc/nginx/nginx.conf
else
    echo "could not find /cert/cert.pem and /cert/cert.key so using regular nginx.conf"
fi


exec /root/entrypoint.sh
