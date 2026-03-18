su -s /bin/sh mysql -c "mariadbd --datadir=/var/lib/mysql" &

sleep 3
mariadb < /mariadb/tools/init_users.sql

kill 0
sleep 2
#exec su -s /bin/sh mysql -c "mariadbd --datadir=/var/lib/mysql"
