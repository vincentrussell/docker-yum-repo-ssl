FROM dgutierrez1287/yum-repo:2.0.0

EXPOSE 443

COPY nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum clean all \
  && yum remove nginx -y \
  && yum install nginx -y

COPY nginx-ssl.conf /etc/nginx/nginx-ssl.conf
COPY entrypoint.sh /root/entrypoint-extended.sh
RUN chmod 700 /root/entrypoint-extended.sh \
 && mkdir -p /cert \
 && yum install -y curl \
 && yum clean all \
 && rm -rf /var/cache/yum/*

HEALTHCHECK --interval=30s --timeout=30s CMD curl --fail –key /cert/cert.key –cert /cert/cert.pem --insecure -I https://localhost:443 || exit 1


VOLUME /cert/cert.pem /cert/cert.key
ENTRYPOINT ["/root/entrypoint-extended.sh"]

LABEL maintainer="Vincent Russell <vincent.russell@gmail.com>"
