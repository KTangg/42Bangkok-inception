FROM debian:buster

RUN apt-get update; \
	apt-get install -y gnupg2 wget default-jdk;

RUN wget https://pkg.jenkins.io/debian/jenkins.io.key; \
	apt-key add jenkins.io.key; \
	echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list; \
	apt-get update; \
	apt-get install -y jenkins

ENTRYPOINT sleep infinity

# Install Jenkin
# RUN apt-get update; \
# 	apt-get install -y default-jdk wget; \
# 	wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | apt-key add -; \
# 	sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'; \
# 	apt-get update; \
# 	apt-get install -y jenkins

# WORKDIR /var/lib/jenkins

# ENTRYPOINT sleep infinity
