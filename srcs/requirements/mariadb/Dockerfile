FROM debian:buster

# Install mariadb
RUN apt-get update ; \
	apt-get install -y mariadb-server mariadb-client


RUN adduser mysql ; \
	chown -R mysql:mysql /var/lib/mysql

# Copy configuration file
COPY tools/mariadb_launcher.sh /tmp/mariadb_launcher.sh
# This for create user and DB
COPY conf/database.conf /tmp/database.conf
# This allow to use root without password
COPY conf/mariadb.conf /etc/mysql/mariadb.cnf
# This for allow remote connection from wordpress
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT sh /tmp/mariadb_launcher.sh
