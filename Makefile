# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/01 10:00:00 by marvin            #+#    #+#              #
#    Updated: 2023/01/01 10:00:00 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a

SRCDIR = srcs
OBJDIR = objs

SRCS = ft_strlen.s \
       ft_strcpy.s \
       ft_strcmp.s \
       ft_write.s \
       ft_read.s \
       ft_strdup.s

OBJS = $(addprefix $(OBJDIR)/, $(SRCS:.s=.o))

AS = as
ASFLAGS = -arch arm64

AR = ar
ARFLAGS = rcs

CC = gcc
CFLAGS = -Wall -Wextra -Werror

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $(ARFLAGS) $(NAME) $(OBJS)

$(OBJDIR)/%.o: $(SRCDIR)/%.s | $(OBJDIR)
	$(AS) $(ASFLAGS) $< -o $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

test: $(NAME)
	$(CC) $(CFLAGS) -o test main.c -L. -lasm

.PHONY: all clean fclean re test