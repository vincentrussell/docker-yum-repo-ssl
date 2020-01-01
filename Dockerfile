FROM dgutierrez1287/yum-repo:2.0.0

EXPOSE 443

COPY nginx-ssl.conf /etc/nginx/nginx-ssl.conf
COPY entrypoint.sh /root/entrypoint-extended.sh
RUN chmod 700 /root/entrypoint-extended.sh
RUN mkdir -p /cert
VOLUME /cert/cert.pem /cert/cert.key
ENTRYPOINT ["/root/entrypoint-extended.sh"]

LABEL maintainer="Vincent Russell <vincent.russell@gmail.com>"
