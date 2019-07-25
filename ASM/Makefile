# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lbopp <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/07/25 12:59:39 by lbopp             #+#    #+#              #
#    Updated: 2019/07/25 13:08:09 by lbopp            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

SULLY = Sully
COLLEEN = Colleen
GRACE = Grace
NASM_FLAG = -Wall -Werror -Wextra
SRC_NAME_COLLEEN = Colleen.s
SRC_NAME_GRACE = Grace.s
SRC_NAME_SULLY = Sully.s
SRC_PATH = srcs
SRC_SULLY = $(addprefix $(SRC_PATH)/,$(SRC_NAME_SULLY))
OBJ_SULLY = $(SRC_SULLY:.s=.o)
SRC_COLLEEN = $(addprefix $(SRC_PATH)/,$(SRC_NAME_COLLEEN))
OBJ_COLLEEN = $(SRC_COLLEEN:.s=.o)
SRC_GRACE = $(addprefix $(SRC_PATH)/,$(SRC_NAME_GRACE))
OBJ_GRACE = $(SRC_GRACE:.s=.o)
RM = rm -f

.PHONY: all, clean, fclean, re

all: $(SULLY) $(COLLEEN) $(GRACE)

$(SULLY): $(OBJ_SULLY)
	ld -macosx_version_min 10.7.0 -lSystem -o $(SULLY) $(OBJ_SULLY)

$(GRACE): $(OBJ_GRACE)
	ld -macosx_version_min 10.7.0 -lSystem -o $(GRACE) $(OBJ_GRACE)

$(COLLEEN): $(OBJ_COLLEEN)
	ld -macosx_version_min 10.7.0 -lSystem -o $(COLLEEN) $(OBJ_COLLEEN)

%.o: %.s
	nasm -f macho64 $^

clean:
	$(RM) $(OBJ_SULLY)
	$(RM) $(OBJ_GRACE)
	$(RM) $(OBJ_COLLEEN)

fclean: clean
	$(RM) $(SULLY)
	$(RM) Sully_*
	$(RM) $(GRACE)
	$(RM) Grace_*
	$(RM) $(COLLEEN)

re: fclean all
