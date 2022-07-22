FROM httpd:alpine

RUN apk update && \ 
	apk add nano && \ 
	mkdir /usr/local/apache2/conf/extra/docker

# Enable/Setup some of the core features in Apache
# ServerTokes Prod - "Prod" restricts visibilty of the OS type and modules being used and prevents them being seen in the headers of web pages
RUN echo "ServerTokens Prod" >> /usr/local/apache2/conf/httpd.conf && \ 
	# ServerSignature off - this turns off Apache version number
	echo "ServerSignature off" >> /usr/local/apache2/conf/httpd.conf && \ 
	# Include the Dir for any of our virtual hosts
	echo "Include /usr/local/apache2/conf/extra/docker/*.conf" >> /usr/local/apache2/conf/httpd.conf
	# echo "Mutex posixsem" >> /usr/local/apache2/conf/httpd.conf

RUN sed -i 's/#LoadModule proxy_module/LoadModule proxy_module/g' /usr/local/apache2/conf/httpd.conf && \ 
	sed -i 's/#LoadModule include_module/LoadModule include_module/g' /usr/local/apache2/conf/httpd.conf && \ 
	sed -i 's/#LoadModule proxy_fcgi_module/LoadModule proxy_fcgi_module/g' /usr/local/apache2/conf/httpd.conf && \ 
	sed -i 's/#LoadModule rewrite_module/LoadModule rewrite_module/g' /usr/local/apache2/conf/httpd.conf

#CMD ["httpd","-D","FOREGROUND"]

EXPOSE 80
EXPOSE 8800