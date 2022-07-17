FROM nginx:alpine

RUN apk update; \
	apk add --no-cache certbot certbot-nginx nano

COPY /run/nginx-entrypoint.sh /run/docker-entrypoint.sh
RUN chmod 777 /run/docker-entrypoint.sh

RUN mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.orig
COPY /nginx/nginx.conf /etc/nginx/nginx.conf

RUN mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf.orig
COPY /nginx/nginx.default.conf /etc/nginx/conf.d/default.conf

# Copy over the localhost SSL certificates
COPY /ssl/localhost.crt /etc/ssl/key/localhost.crt
COPY /ssl/localhost.key /etc/ssl/key/localhost.key

# RUN adduser -H -D www-data -G www-data; \
# 	chown -R www-data:www-data /var/www/html; \
# 	chown -R www-data:www-data /var/lib/nginx

RUN mkdir -p /var/www/html; \
	chown -R nginx:nginx /var/www/html

EXPOSE 80
EXPOSE 443

WORKDIR /var/www/html

ENTRYPOINT [ "/run/docker-entrypoint.sh" ]