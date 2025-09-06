NAME= test

CC= gcc

CFLAGS = -Werror -Wall -Wextra

RF = rm -f

SRC = main.c

OBJ = $(SRC:.c=.o)

all: $(NAME)

$(NAME): $(OBJ)
	$(CC) $(OBJ) -Lmlx_linux -lmlx_Linux -L/usr/lib -Imlx_linux -lXext -lX11 -lm -lz -o $(NAME)

%.o: %.c
	$(CC) -Wall -Wextra -Werror -I/usr/include -Imlx_linux -O3 -c $< -o $@

clean:
	$(RM) $(OBJ)

fclean: clean $(RM) $(NAME)

re: fclean all

.PHONY:
	all clean fclean re

