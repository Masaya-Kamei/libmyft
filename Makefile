NAME	=	libmyft.a

ifeq ($(shell uname),Darwin)
	JOIN	= 	libtool -o
else
	JOIN	=	ar cqT
endif

LIBFTDIR		:=	libft
LIBFTTARGET		:=	all
LIBFT			:=	$(LIBFTDIR)/libft.a

LIBDCLISTDIR	:=	libdclist
LIBDCLISTTARGET	:=	all
LIBDCLIST		:=	$(LIBDCLISTDIR)/libdclist.a

all		:	$(NAME)

$(NAME)	:	$(LIBFT) $(LIBDCLIST)
			$(JOIN) $(NAME) $(LIBFT) $(LIBDCLIST)

$(LIBFT):
			make -C $(LIBFTDIR) $(LIBFTTARGET)

$(LIBDCLIST):
			make -C $(LIBDCLISTDIR) $(LIBDCLISTTARGET)

clean	:
			make -C $(LIBFTDIR) clean
			make -C $(LIBDCLISTDIR) clean

fclean	:
			make -C $(LIBFTDIR) fclean
			make -C $(LIBDCLISTDIR) fclean

re		:	fclean all

debug	:	LIBFTTARGET		= debug
debug	:	LIBDCLISTTARGET	= debug
debug	:	re

address	:	LIBFTTARGET		= address
address	:	LIBDCLISTTARGET	= address
address	:	re

address	:	LIBFTTARGET		= leak
address	:	LIBDCLISTTARGET	= leak
leak	:	re

.PHONY	:	all clean fclean re debug address leak
