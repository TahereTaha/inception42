su -s /bin/sh mysql -c "mariadbd --datadir=/var/lib/mysql" &

while ! mariadb-admin ping -h localhost ; do
    sleep 1
done

mariadb < /mariadb/tools/init_db.sql

mariadb-admin shutdown -h localhost
