FROM nginx:latest

RUN apt-get update \
    && apt-get install nano -y \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/api_conf.d

COPY ./conf /conf

COPY server.crt  /etc/nginx/server.crt
COPY server.key  /etc/nginx/server.key

ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh -v

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 80 443 8443 8010

ENTRYPOINT ["/docker-entrypoint.sh"]
