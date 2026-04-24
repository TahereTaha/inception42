
#	set up the enviroment.
export $(< /wordpress/.build.env tr '\n' ' ')

echo "before timer"
sleep 10
echo "after timer"

wp core is-installed --allow-root
if  [ $? -eq 1 ] ; then
	wp core install \
		--url="$SITE_URL" \
		--title="$WP_SITE_TITLE" \
		--admin_user="$WP_ADMIN_USER" \
		--admin_password="$WP_ADMIN_PASSWORD" \
		--admin_email="$WP_ADMIN_EMAIL" 
fi

exec php-fpm83 -F  

