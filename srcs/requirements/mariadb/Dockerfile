FROM alpine:3.22

RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache mariadb su-exec \
	&& mariadb-install-db --user=mysql --datadir=/var/lib/mysql \
	&& (cd /run && mkdir mysqld && chown mysql:mysql mysqld )


#ENTRYPOINT su-exec mariadbd --datadir=/var/lib/mysql

ENTRYPOINT sh 


