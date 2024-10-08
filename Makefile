NAME 		= cub3D
CC 			= gcc
CFLAGS 		= -Wall -Wextra -Werror -finline-functions -fvectorize -fslp-vectorize -ffast-math -falign-functions -funroll-loops -fstrict-aliasing -fomit-frame-pointer -flto -Ofast -O1 -O2 -Os -O3
MLXFLAGS	= -L./minilibx -I./minilibx -lmlx -framework OpenGl -framework Appkit
MLX_PATH	= ./minilibx


R		= \033[1;31m
B		= \033[1;34m
RS		= \033[0m
G		= \033[0;32m
Y		= \033[33;6m
W		= \033[37;6m
O		= \033[38;2;255;165;0m

SRC			= cub3d.c	\
			  raycast.c	\
			  mlx_init.c \
			  parsing/flood_fill.c	\
			  parsing/mainparsing.c	\
			  parsing/ft_split.c	\
			  parsing/utils.c	\
			  parsing/utils2.c	\
			  parsing/init_utils.c \
			  parsing/init_utils2.c \
			  parsing/GNL/get_next_line.c	\
			  parsing/GNL/get_next_line_utils.c	\
			  hook.c	\
			  cub3d_utils.c	\
			  cub3d_utils2.c	\
			  bonus_utils.c


OBJ = $(SRC:.c=.o)

all: cute ${NAME}

${NAME}: $(OBJ)
		@$(MAKE)  -C $(MLX_PATH)
		@echo "$(G)MINILIBX COMPILED!$(RS)"
		@$(CC) $(CFLAGS) -lm $(SRC) $(MLXFLAGS) -o $(NAME)
		@echo "$(G)CUB3D CREATED!$(RS)"

%.o: %.c
	@${CC} ${CFLAGS} ${THREAD_FLG} -c $< -o $@

clean:
		@rm -rf $(OBJ)
		$(MAKE) clean -C ./minilibx
		@echo "OBJECT FILES $(R)DELETED$(RS)"

fclean: clean
		@rm -rf $(NAME) $(OBJ)
		@echo "CUB3D $(R)DELETED$(RS)"

re: fclean all

.PHONY: all clean fclean re

cute:
	@echo "                                                                        ⭐"
	@echo "                               /ˉˉˉˉˉˉˉˉˉˉˉˉˉˉˉˉˉˉˉˉˉˉˉ|                         "
	@echo "            🌙      /$(B)██████$(RS)/$(W)██████$(RS)/$(G)██████$(RS)/          -  /    /ˉˉˉˉˉˉˉˉˉˉˉˉˉˉ/   /ˉˉˉˉˉˉˉˉˉˉ/               "
	@echo "                /$(O)██████$(RS)/$(Y)██████$(RS)/$(R)██████$(RS)/ $(Y)█$(RS)|    ╔══════════════╗ˉˉˉ╔══════════╗  /  /ˉˉˉˉˉ/  ˉ/"
	@echo "             /$(W)██████$(RS)/$(G)██████$(RS)/$(B)██████$(RS)/ $(G)█$(RS)|$(Y)██$(RS)|    $(R)██████████████$(RS)╔╝  $(B)███████████$(RS) ╚═╗  /      ˉ/  ˉ/ "
	@echo "          /------|------|------/ $(O)█$(RS)|$(G)██$(RS)|$(Y)██$(RS)|  -       /  ╔$(R)███$(RS)═╝   $(B)███$(RS) ║/ˉ   $(B)███$(RS) ╚═╗        ˉ/  ˉ/ "
	@echo "          |$(R)██████$(RS)|$(Y)██████$(RS)|$(W)██████$(RS)|$(O)██$(RS)|$(G)██$(RS)|$(Y)█$(RS) /         / ╔$(R)███$(RS)═╝   /ˉ$(B)███$(RS) ║       $(B)███$(RS) ╚╗       ˉ/  ˉ/"
	@echo "          |$(R)██████$(RS)|$(Y)██████$(RS)|$(W)██████$(RS)|$(O)██$(RS)|$(G)█$(RS) / $(W)█$(RS)|        /╔$(R)███$(RS)═╝  /ˉˉ /$(B)███$(RS) ║      / $(B)███$(RS) ╚╗       ˉ/  ˉ/ "
	@echo "          |$(R)██████$(RS)|$(Y)██████$(RS)|$(W)██████$(RS)|$(O)█$(RS) / $(R)█$(RS)|$(W)██$(RS)|       ╔$(R)███$(RS) ╚══╗ˉ    ˉ$(B)███$(RS) ║     /  /$(B)███$(RS) ╚╗       ˉ/ ˉ/ "
	@echo "          |------|------|------/ $(B)█$(RS)|$(R)██$(RS)|$(W)██$(RS)|   - $(R) █████████$(RS)╚═╗ˉˉˉ/$(B)███$(RS) ║    /  /  $(B)███$(RS) ║      /ˉ  /"
	@echo "          |$(Y)██████$(RS)|$(B)██████$(RS)|$(R)██████$(RS)|$(B)██$(RS)|$(R)██$(RS)|$(W)█$(RS) /     /       ╚$(R)███$(RS)╚═╗ ˉ$(B)███$(RS) ║   /  /  ╔$(B)███$(RS)╔╝    /ˉ  /ˉ"
	@echo "          |$(Y)██████$(RS)|$(B)██████$(RS)|$(R)██████$(RS)|$(B)██$(RS)|$(R)█ $(RS)/ $(O)█$(RS)|    /<><><><><>$(R) ███$(RS)╚╗ $(B)███$(RS) ║/ /  /<>╔$(B)███$(RS)╔╝  /ˉˉ  /ˉ"
	@echo "          |$(Y)██████$(RS)|$(B)██████$(RS)|$(R)██████$(RS)|$(B)█$(RS) / $(B)█$(RS)|$(O)██$(RS)| ╔═══╗ˉˉ/<><><><╚$(R)███$(RS)║ $(B)███$(RS) ║ /  /<>╔$(B)███$(RS)╔╝ /ˉˉ /ˉˉ<><>     "
	@echo "          |------|------|------/ $(Y)█$(RS)|$(B)██$(RS)|$(O)██$(RS)| $(R)███$(RS) ╚╗ ˉ/<><><>╔$(R)███$(RS)╝/$(B)███$(RS) ║/   --╔$(B)███$(RS)╔╝ˉˉ /ˉˉ<><></$(G)██$(RS)  "
	@echo "        /<|$(G)██████$(RS)|$(G)██████$(RS)|$(O)██████$(RS)|$(Y)██$(RS)|$(B)██$(RS)|$(O)█$(RS) /<$(R) ███$(RS) ╚═════════$(R)███$(RS)╝ˉ $(B)███$(RS) ╚══════$(B)███$(RS)═╝/ˉˉˉ<><><></$(G)██$(RS)/"
	@echo "       /<>|$(G)██████$(RS)|$(G)██████$(RS)|$(O)██████$(RS)|$(Y)██$(RS)|$(B)█$(RS) /<><><>╚$(R)██████████████$(RS)╝/ˉˉ$(B)████████████$(RS)═╝<><><><><><>/$(G)██$(RS)/"
	@echo "      /<><|$(G)██████$(RS)|$(G)██████$(RS)|$(O)██████$(RS)|$(Y)█$(RS) / <><><><><><><><><><><><><><><><><><><><><><><><><><>/$(G)██$(RS)/                                     "
	@echo "     /<><> --------------------/ <><><><><><><><><><><><><><><><><><><><><><><><><><><>/$(G)██$(RS)/                                  "
	@echo "    /<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><></$(G)██$(RS)/               "
	@echo "    $(G)████████████████████████████████████████████████████████████████████████████████████$(RS)/  "
	@echo "                                                                                   "
	@echo "                                                            Made by : \033[1;91mabolor-e\033[m "