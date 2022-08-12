FROM debian:buster


# Install nginx and openssl(for TLS)
RUN apt-get update; \
	apt-get install -y nginx \
	openssl \
	# Use only for testing
	curl

# Create certificates and key (Valid 30 day)
RUN openssl req -x509 -nodes -days 30 -newkey rsa:2048 \
	-keyout /etc/ssl/private/inception.key -out /etc/ssl/certs/inception.crt \
	# Fill prompt information
	-subj "/C=TH/ST=Bangkok/L=Bangkok/O=42Bangkok/OU=Crocodile/CN=spoolpra.42.fr"

# Copy config file
COPY conf/nginx.conf /etc/nginx/sites-available/inception

# Create softlink in sites-enabled && remove default
RUN ln -s /etc/nginx/sites-available/inception /etc/nginx/sites-enabled/; \
	rm /etc/nginx/sites-enabled/default

RUN echo "Starting nginx server..."

ENTRYPOINT nginx -g 'daemon off;'
