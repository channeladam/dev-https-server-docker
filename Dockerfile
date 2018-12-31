FROM alpine:latest as main

LABEL version="0.1"
LABEL description="HTTPS web server for a development environment"

RUN apk add --no-cache nodejs \
        npm \
        ca-certificates \
        supervisor \
    && mkdir -p /var/log/supervisord \
    && chown 1000 /var/log/supervisord \
    && mkdir /.npm \
    && chown 1000 /.npm \
    && mkdir -p /usr/local/dev-https-server \
    && mkdir -p /var/log/dev-https-server \
    && chown 1000 /var/log/dev-https-server \
    && cd /usr/local/dev-https-server \
    && npm init -y \
    && npm install http-server \
    && npm install local-ssl-proxy

USER 1000

COPY supervisord.conf /etc/supervisord.conf

CMD ["/usr/bin/supervisord"]
