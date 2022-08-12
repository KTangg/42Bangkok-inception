if [ ! -d /var/run/redis ]; then
	mkdir -p /var/run
	mkdir -p /var/run/redis
fi

grep "requirepass foobared" /etc/redis/redis.conf

# Change redis password on first run
if [ $? -eq 0 ]; then
	sed -i "s/foobared/$REDIS_PASS/1" /etc/redis/redis.conf
fi

/usr/bin/redis-server
