# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: spoolpra <spoolpra@student.42bangkok.co    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/03 22:34:01 by spoolpra          #+#    #+#              #
#    Updated: 2022/08/12 21:25:53 by spoolpra         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: up
up: env
	docker-compose -f srcs/docker-compose.yml up -d
debug: env
	docker-compose -f srcs/docker-compose.yml up
env:
	@ export $(grep -v '^#' srcs/.env | xargs -d '\n') > /dev/null

clean: env
	docker-compose -f srcs/docker-compose.yml down --rmi all -v

fclean: clean
	sudo rm -rf /home/$(USER)/data/wordpress/*
	sudo rm -rf /home/$(USER)/data/mariadb/*
build: env
	docker-compose -f srcs/docker-compose.yml build --no-cache

re: fclean build up
