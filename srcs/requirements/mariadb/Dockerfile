FROM alpine:3.22

WORKDIR /

#	install all the dependencies.
RUN apk update \
	&& apk upgrade \
	&& apk add --no-cache mariadb mariadb-client

#	initialize the folders that mariadb needs.
RUN mariadb-install-db --user=mysql --datadir=/var/lib/mysql
RUN cd /run && mkdir mysqld && chown mysql:mysql mysqld
RUN mkdir mariadb

#	set up the conf file for mariadb to bind on all network devices.
COPY conf /mariadb/conf
RUN cp /mariadb/conf/mariadb.conf /etc/my.cnf

#	set up the database.
COPY tools /mariadb/tools
RUN chmod +x /mariadb/tools/init_db.sh
RUN /mariadb/tools/init_db.sh

ENTRYPOINT ["su", "-s", "/bin/sh", "mysql", "-c", "mariadbd --datadir=/var/lib/mysql"]
