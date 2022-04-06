LIBFTDIR		=	libft
LIBDCLISTDIR	=	libdclist
LIBGNLDIR		=	libgnl

vpath	%.c $(LIBFTDIR)/srcs:$(LIBDCLISTDIR)/srcs:$(LIBGNLDIR)/srcs

SRCS	=	ft_strlen.c ft_strlcpy.c ft_strlcat.c ft_strchr.c ft_strrchr.c \
			ft_strnstr.c ft_strncmp.c ft_memset.c ft_bzero.c ft_memcpy.c \
			ft_memccpy.c ft_memmove.c ft_memchr.c ft_memcmp.c ft_atoi.c \
			ft_isalpha.c ft_isdigit.c ft_isalnum.c ft_isascii.c ft_isprint.c \
			ft_toupper.c ft_tolower.c ft_calloc.c ft_strdup.c ft_substr.c \
			ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c \
			ft_striteri.c ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c \
			ft_putnbr_fd.c \
			ft_lstnew.c ft_lstadd_front.c ft_lstsize.c ft_lstlast.c \
			ft_lstadd_back.c ft_lstdelone.c ft_lstclear.c ft_lstiter.c \
			ft_lstmap.c
SRCS	+=	dclst_addback.c dclst_addfront.c dclst_clear.c dclst_delone.c \
			dclst_exist.c dclst_last.c dclst_link.c dclst_new.c \
			dclst_new_size.c dclst_new_addback.c dclst_new_addfront.c \
			dclst_size.c dclst_first.c dclst_issentinel.c dclst_pop.c \
			dclst_popdel.c dclst_popdel_next.c dclst_with_take_p.c
SRCS	+=	get_next_line.c get_next_line_utils.c

OBJSDIR	=	./objs
OBJS	=	$(addprefix $(OBJSDIR)/, $(SRCS:.c=.o))

INCLUDE	=	-I$(LIBFTDIR)/includes
INCLUDE	+=	-I$(LIBDCLISTDIR)/includes
INCLUDE	+=	-I$(LIBGNLDIR)/includes
NAME	=	libmyft.a

CC		=	gcc
CFLAGS	=	-Wall -Wextra -Werror
AR		=	ar rc
RM		=	rm -f

all		:	$(NAME)

$(NAME)	:	$(OBJS)
			$(AR) $(NAME) $(OBJS)

$(OBJSDIR)/%.o	:	%.c
			@mkdir -p $(dir $@)
			$(CC) $(CFLAGS) $(INCLUDE) -o $@ -c $<

clean	:
			$(RM) $(OBJS)

fclean	:	clean
			$(RM) $(NAME)

re		:	fclean all

debug	:	CFLAGS +=	-g
debug	:	re

address	:	CFLAGS += 	-g -fsanitize=address
address	:	re

leak	:	CC		=	/usr/local/opt/llvm/bin/clang
leak	:	CFLAGS += 	-g -fsanitize=leak
leak	:	re

.PHONY	:	all clean fclean re debug address leak
