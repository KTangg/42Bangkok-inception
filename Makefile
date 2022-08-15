# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: spoolpra <spoolpra@student.42bangkok.co    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/03 22:34:01 by spoolpra          #+#    #+#              #
#    Updated: 2022/08/15 08:44:33 by spoolpra         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: up
up: env create_mount_dir
	docker-compose -f srcs/docker-compose.yml up -d
debug: env create_mount_dir
	docker-compose -f srcs/docker-compose.yml up
env:
	@ export $(grep -v '^#' srcs/.env | xargs -d '\n') > /dev/null
create_mount_dir:
	mkdir -p $(HOME)/data
	mkdir -p $(HOME)/data/wordpress && mkdir -p $(HOME)/data/mariadb
clean: env
	docker-compose -f srcs/docker-compose.yml down --rmi all -v

fclean: clean
	sudo rm -rf $(HOME)/wordpress/*
	sudo rm -rf $(HOME)/mariadb/*
build: env create_mount_dir
	docker-compose -f srcs/docker-compose.yml build --no-cache

re: fclean build up
