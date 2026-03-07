FROM alpine:3.23

WORKDIR /app

RUN apk add --no-cache \
    bash \
    php \
    fcgi \
    php-cgi \
    curl \
    ca-certificates \
	php83-fpm


RUN apk add --no-cache \
    php83-fpm php83-phar php83-mysqli php83-json \
    php83-mbstring php83-xml php83-zip php83-curl php83-opcache

#Install WordPress
RUN curl -o /app/latest.tar.gz https://wordpress.org/latest.tar.gz

# Install WP-CLI
RUN curl -s -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp

COPY ./tools/ .
RUN chmod +x init.sh

SHELL ["/bin/bash", "-c"]

ENTRYPOINT ["./init.sh"]
