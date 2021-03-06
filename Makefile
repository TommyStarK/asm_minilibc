##
## Makefile for Makefile in 
## 
## Made by THOMAS MILOX
## Login   <loxmi@epitech.net>
## 
## Started on  Sat Mar 14 02:39:04 2015 THOMAS MILOX
## Last update Sun Mar 22 18:45:10 2015 Johan Paasche
##


ASM		=	nasm

CC		=	gcc

CFLAGS		=	-W -Wall -Wextra

LDFLAGS		=	-shared

SRC_DIR		=	src

SRC 		=	$(SRC_DIR)/rindex.S	\
			$(SRC_DIR)/strlen.S	\
			$(SRC_DIR)/strstr.S	\
			$(SRC_DIR)/strchr.S	\
			$(SRC_DIR)/strpbrk.S	\
			$(SRC_DIR)/strcspn.S	\
			$(SRC_DIR)/strcasecmp.S	\
			$(SRC_DIR)/memcpy.S	\
			$(SRC_DIR)/strcmp.S	\
			$(SRC_DIR)/strncmp.S	\
			$(SRC_DIR)/memset.S	\
			$(SRC_DIR)/memmove.S	\
			$(SRC_DIR)/strrchr.S	\
			$(SRC_DIR)/strchrnul.S	\
			$(SRC_DIR)/strspn.S	\
			$(SRC_DIR)/strnlen.S	\


OBJ		=	$(SRC:.S=.o)

ASMFLAGS	=	-f elf64

NAME		=	libasm.so

TEST_NAME	=	test

%.o:			%.S
			${ASM} $< ${ASMFLAGS} -o $@

${NAME}		:	$(OBJ)
			$(CC) $(LDFLAGS) -o $(NAME) $(OBJ)

test		:	$(OBJ)
			$(CC) $(CFLAGS) $(OBJ) main.c -o $(TEST_NAME)

all		:	${NAME}

clean		:
			rm -f $(OBJ)

fclean		:	clean
			rm -f $(NAME)
			rm -f $(TEST_NAME)

re		:	fclean ${NAME}

.PHONY		:	all clean fclean re
