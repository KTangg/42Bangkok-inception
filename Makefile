# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: spoolpra <spoolpra@student.42bangkok.co    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/08/03 22:34:01 by spoolpra          #+#    #+#              #
#    Updated: 2022/08/09 10:16:55 by spoolpra         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	docker-compose -f srcs/docker-compose.yml build --no-cache
	docker-compose -f srcs/docker-compose.yml up

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all

prune:
	docker prune

fclean: clean

re: fclean all
