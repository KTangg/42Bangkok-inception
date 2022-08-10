# Check if volume database exist or not
if [ ! -d /var/lib/mysql/wordpress ]; then
	# Start mysql service
	service mysql start
	# Create WP database and user
	sed "s/MYSQL_USER/$MYSQL_USER/g" /tmp/database.conf \
	| sed -e "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" \
	| sed -e "s/MYSQL_ROOTPASSWORD/$MYSQL_ROOTPASSWORD/g" | mysql --user=root ;
fi

# Help on 1st launch with existed volume
if [ ! -d "/run/mysqld" ]; then
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld
fi

mysqld -u mysql -D
