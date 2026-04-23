
#	set up the enviroment.
export $(< /wordpress/.build.env tr '\n' ' ')

exec php-fpm84 -F


