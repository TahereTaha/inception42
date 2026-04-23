FROM alpine:3.22

WORKDIR /

#install all the dependencies.
RUN	apk update \
	&& apk upgrade \
	&& apk add --no-cache \
		mariadb-client \
		php83 \
		php83-fpm \
		php83-gd \
		php83-zlib \
		php83-phar \
		php83-mysqli \
		php83-curl \
		php83-mbstring \
		php83-openssl \
		php83-xml \
		php83-zip \
		php83-dom \
		php83-exif \
		php83-intl \
		php83-session \
		php83-ctype \
		php83-fileinfo \
		php83-redis 


#coping over some scripts.
RUN mkdir -p /wordpress
COPY .build.env /wordpress/.build.env
COPY tools /wordpress/tools
COPY conf /wordpress/conf/
RUN mv /wordpress/conf/www.conf /etc/php83/php-fpm.d/www.conf
RUN chmod +x /wordpress/tools/init_wp_config_file.sh


#install wordpress.
WORKDIR /var/www
RUN	mkdir -p /var/www/
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xf latest.tar.gz
RUN rm -rf latest.tar.gz

WORKDIR /var/www/wordpress
RUN mv wp-config-sample.php wp-config.php
RUN /wordpress/tools/init_wp_config_file.sh

#ENTRYPOINT ["/wordpress/run.sh"]
ENTRYPOINT ["php-fpm83", "-F"]

