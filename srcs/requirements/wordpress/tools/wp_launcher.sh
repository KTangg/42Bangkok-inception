# Connect to DB
while ! mariadb --host=$DB_HOST --user=$MYSQL_USER --password=$MYSQL_PASSWORD --port=3306 $DB_NAME; do
	echo "Try to reconnect to mariadb-server";
	sleep 10;
done
echo "Connected to mariadb-server"

# Check if wordpress is already exist
if [ ! -f wp-config.php ]; then
	wp core download --allow-root
	wp config create --dbhost=$DB_HOST --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --allow-root
	wp core install --url=localhost --title="Inception" --admin_name=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=spoolpra@student.42bangkok.com --allow-root
	wp user create $WP_USER armel@student.42bangkok.com --role=author --user_pass=$WP_USER_PASSWORD --allow-root
	chown -R www-data:www-data /var/www/inception
fi

service php7.3-fpm start
service php7.3-fpm stop

/usr/sbin/php-fpm7.3 -F -R
