FROM debian:buster

# Install wordpress dependencies
RUN apt-get update; \
	# Install curl (Download wordpress-cli)
	apt-get install -y curl \
	# Install php (https://ubuntu.com/tutorials/install-and-configure-wordpress#2-install-dependencies)
	php7.3 \
	php7.3-bcmath \
	php7.3-curl \
	php7.3-imagick \
	php7.3-intl \
	php7.3-json \
	php7.3-mbstring \
	php7.3-mysql \
	php7.3-xml \
	php7.3-zip \
	php7.3-fpm \
	mariadb-client

# Copy php-fpm.conf (Emergency restart & log level)
COPY conf/php-fpm.conf /etc/php/7.3/fpm/php-fpm.conf
# Copy www.conf (Listen to port 9000) to container
COPY conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

# Download && install wordpress cli
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
	chmod +x wp-cli.phar; \
	mv wp-cli.phar /usr/local/bin/wp

# Create wordpress directory if it doesn't exist yet
RUN mkdir -p /var/www; \
	mkdir -p /var/www/inception

# Change working directory to wordpress directory
WORKDIR /var/www/inception

# Copy wordpress container launcher
COPY tools/wp_launcher.sh /tmp/wp_launcher.sh

ENTRYPOINT sh /tmp/wp_launcher.sh
