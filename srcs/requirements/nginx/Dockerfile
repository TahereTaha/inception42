FROM alpine:3.22

WORKDIR /

#install all the dependencies.
RUN	apk update \
	&& apk upgrade \
	&& apk add --no-cache \
	nginx \
	openssl


#coping over some configs.
RUN mkdir -p /nginx
COPY .build.env /nginx/.build.env
COPY conf /nginx/conf

WORKDIR /nginx
RUN openssl req -newkey rsa:4096  -x509  -sha512  -days 365 -nodes \
	-out certificate.pem \
	-keyout privatekey.pem \
	-subj "/C=SI/ST=Ljubljana/L=Ljubljana/O=Security/OU=IT Department/CN=tatahere.42.fr"

#install wordpress.
WORKDIR /etc/nginx/http.d
RUN mv /nginx/conf/wordpress.conf wordpress.conf
RUN rm default.conf

#ENTRYPOINT ["/wordpress/run.sh"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]

