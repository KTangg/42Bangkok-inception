# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: spoolpra <spoolpra@student.42bangkok.co    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/03 22:34:01 by spoolpra          #+#    #+#              #
#    Updated: 2022/08/15 18:14:49 by spoolpra         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: up
up: create_mount_dir
	cd srcs && docker-compose up -d
debug: create_mount_dir
	cd srcs && docker-compose up
down:
	docker-compose -f srcs/docker-compose.yml down
create_mount_dir:
	mkdir -p $(HOME)/data
	mkdir -p $(HOME)/data/wordpress && mkdir -p $(HOME)/data/mariadb && mkdir -p $(HOME)/data/jenkin
clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all -v
fclean: clean
	sudo rm -rf $(HOME)/wordpress/*
	sudo rm -rf $(HOME)/mariadb/*
	sudo rm -rf $(HOME)/jenkin/*
build: create_mount_dir
	cd srcs && docker-compose build --no-cache

re: fclean build up
