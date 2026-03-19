su -s /bin/sh mysql -c "mariadbd --datadir=/var/lib/mysql" &

sleep 3
mariadb < /mariadb/tools/init_db.sql

kill 0
sleep 2
