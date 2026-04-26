#!/bin/sh
#	set up the enviroment.
export $(< /wordpress/.build.env tr '\n' ' ')

while ! mariadb-admin ping -h my_mariadb -u $MARIADB_USER -p$MARIADB_PASSWORD ; do
    sleep 1
done

wp core is-installed --allow-root
if [ $? -eq 1 ]; then 
	wp core install \
		--url="$SITE_URL" \
		--title="$WP_SITE_TITLE" \
		--admin_user="$WP_ADMIN_USER" \
		--admin_password="$WP_ADMIN_PASSWORD" \
		--admin_email="$WP_ADMIN_EMAIL"

	wp user create --allow-root "$WP_USER" "$WP_USER_EMAIL" --role=author \
			--user_pass="$WP_USER_PASSWORD"
fi



exec php-fpm83 -F 

