# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lbopp <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/03/12 10:03:24 by lbopp             #+#    #+#              #
#    Updated: 2019/06/21 13:32:27 by lbopp            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SULLY = Sully
COLLEEN = Colleen
GRACE = Grace
CFLAGS = -Wall -Werror -Wextra
LIBFT = libft/
CC = clang
SRC_NAME_COLLEEN = Colleen.c
SRC_NAME_GRACE = Grace.c
SRC_NAME_SULLY = Sully.c
SRC_PATH = srcs
SRC_SULLY = $(addprefix $(SRC_PATH)/,$(SRC_NAME_SULLY))
OBJ_SULLY = $(SRC_SULLY:.c=.o)
SRC_COLLEEN = $(addprefix $(SRC_PATH)/,$(SRC_NAME_COLLEEN))
OBJ_COLLEEN = $(SRC_COLLEEN:.c=.o)
SRC_GRACE = $(addprefix $(SRC_PATH)/,$(SRC_NAME_GRACE))
OBJ_GRACE = $(SRC_GRACE:.c=.o)
RM = rm -f

.PHONY: all, clean, fclean, re

all: $(SULLY) $(COLLEEN) $(GRACE)

$(SULLY): $(OBJ_SULLY)
	$(CC) $(CFLAGS) -o $(SULLY) $(OBJ_SULLY)

$(GRACE): $(OBJ_GRACE)
	$(CC) $(CFLAGS) -o $(GRACE) $(OBJ_GRACE)

$(COLLEEN): $(OBJ_COLLEEN)
	$(CC) $(CFLAGS) -o $(COLLEEN) $(OBJ_COLLEEN)

%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o $@

clean:
	$(RM) $(OBJ_SULLY)
	$(RM) $(OBJ_GRACE)
	$(RM) $(OBJ_COLLEEN)

fclean: clean
	$(RM) $(SULLY)
	$(RM) Sully_*
	$(RM) $(GRACE)
	$(RM) $(COLLEEN)

re: fclean all
