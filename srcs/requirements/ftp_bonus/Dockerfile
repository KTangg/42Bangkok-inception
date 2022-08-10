FROM debian:buster

# Install ftp
RUN apt-get update; \
	apt-get install -y vsftpd

RUN mkdir -p /home/test; \
	mkdir -p /home/test/ftp; \
	chown nobody:nogroup /home/test/ftp; \
	chmod a-w /home/test/ftp; \
	mkdir -p /home/test/ftp/files; \
	chown test:test /home/test/ftp/files; \
	echo "test" > /etc/vsftpd.userlist; \
	echo "test file" > /home/test/ftp/files/test.txt

# Setting configuration in container
COPY conf/vsftpd.conf /etc/vsftpd.conf


ENTRYPOINT sleep infinity
