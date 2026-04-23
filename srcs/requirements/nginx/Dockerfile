FROM alpine:3.22

WORKDIR /

#install all the dependencies.
RUN	apk update \
	&& apk upgrade \
	&& apk add --no-cache nginx 


#coping over some configs.
RUN mkdir -p /nginx
COPY .build.env /nginx/.build.env
COPY conf /nginx/conf


#install wordpress.
WORKDIR /etc/nginx/http.d
RUN mv /nginx/conf/wordpress.conf wordpress.conf
RUN rm default.conf

#ENTRYPOINT ["/wordpress/run.sh"]
ENTRYPOINT ["nginx", "-g", "daemon off;"]

