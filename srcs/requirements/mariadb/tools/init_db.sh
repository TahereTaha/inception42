
#	set up the enviroment.

export $(< /mariadb/.build.env tr '\n' ' ')
sed -i -e "s/MARIADB_DB/$MARIADB_DB/g" -e "s/MARIADB_USER/$MARIADB_USER/g" -e "s/MARIADB_PASSWORD/$MARIADB_PASSWORD/g" /mariadb/tools/init_db.sql

#	start up the database.
su -s /bin/sh mysql -c "mariadbd --datadir=/var/lib/mysql" &
while ! mariadb-admin ping -h localhost ; do
    sleep 1
done

#	set up the database and user.
mariadb < /mariadb/tools/init_db.sql

#	shut down the database.
mariadb-admin shutdown -h localhost
