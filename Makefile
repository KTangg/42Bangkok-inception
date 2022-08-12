# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: spoolpra <spoolpra@student.42bangkok.co    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/03 22:34:01 by spoolpra          #+#    #+#              #
#    Updated: 2022/08/12 20:28:00 by spoolpra         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: env
	docker-compose -f srcs/docker-compose.yml up

env:
	@ export $(grep -v '^#' srcs/.env | xargs) > /dev/null 2>&1

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v

fclean: clean
	sudo rm -rf /home/$(USER)/data/wordpress/*
	sudo rm -rf /home/$(USER)/data/mariadb/*

re: fclean env
	docker-compose -f srcs/docker-compose.yml build --no-cache
	docker-compose -f srcs/docker-compose.yml up
