FROM nginx:latest

RUN apt-get update \
    && apt-get install nano -y \
    && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY server.crt  /etc/nginx/server.crt
COPY server.key  /etc/nginx/server.key
