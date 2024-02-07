##
## EPITECH PROJECT, 2024
## Makefile
## File description:
## Makefile
##

SRCS =	strchr.asm \
		strrchr.asm \
		strlen.asm \
		strrchr.asm \
		memset.asm \
		memcpy.asm

OBJ_DIR = obj

OBJ = $(SRCS:%.asm=$(OBJ_DIR)/%.o)

NAME  = libasm.so

ASM  ?= nasm

ASMFLAGS += -f elf64 -Wall -g

DEBUGFLAGS += -g $(ASMFLAGS)

LINKER ?= gcc
LINKFLAGS += -shared -nostdlib -fPIC

all: $(NAME)

$(OBJ_DIR)/%.o: %.asm
	@$(ASM) $(ASMFLAGS) $< -o \
$(addprefix $(OBJ_DIR)/, $(basename $(subst /,-,$<)).o)

$(NAME): $(OBJ)
	@$(LINKER) -o $(NAME) $(OBJ_DIR)/*.o $(LINKFLAGS)
	@echo -e "[1;32mProject built successfully[0m"

debug:	clean
	@$(ASM) $(SRCS) -o $(NAME) $(DEBUGFLAGS)
	@echo -e "[1;33mProject built in debug mode[0m"

clean:
	@rm $(OBJ_DIR)/*.o .idea/ -rf
	@rm *.gcno -rf
	@find . -type f,d \( -name "*~" -o -name "\#*\#" \) -delete
	@find . -type f,d -name "vgcore*" -delete
	@echo -e "[1;34mRepo cleaned[0m"

fclean: clean
	@rm $(NAME) -rf
	@find . -type f,d -name "*.a" -delete
	@echo -e "[1;31mProject binary deleted[0m"

re: fclean $(NAME)

.PHONY: all $(NAME) clean fclean re
