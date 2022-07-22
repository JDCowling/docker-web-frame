FROM php:fpm-alpine3.16

RUN apk update

RUN apk add --no-cache \
		ca-certificates \
		curl \
		tar \
		xz \
		git \
		gzip 


ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/