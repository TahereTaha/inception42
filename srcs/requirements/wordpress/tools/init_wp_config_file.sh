
#	set up the enviroment.
export $(< /wordpress/.build.env tr '\n' ' ')

#	prepare the script file.
sed -i -e "s/database_name_here/$MARIADB_DB/g" -e "s/username_here/$MARIADB_USER/g" -e "s/password_here/$MARIADB_PASSWORD/g" -e "s/localhost/$MARIADB_HOST/g" /var/www/wordpress/wp-config.php




