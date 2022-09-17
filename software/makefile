# Makefile fÃ¼r die kompilierung von AVR Mikrocontroller Projekten
# gilt nur fÃ¼r Programme geschrieben mit C
# Author: www.circuitfault.ch
#
#	make all	startet den build Prozess und uploadet die firmware
#				auf den Mikrocontroller
#	make build	startet den build Prozess
#	make dir	erstellt die Ordnerstruktur fÃ¼r den build Prozess

# Name der BinÃ¤rdatei / des Programm
APPNAME = firmware
# Alle ordner mit .c Dateien hier eingeben und mit Leerschlag trennen
SRC_FOLDERS = src

# Compiler und Linker Flags
CC = gcc
CFLAGS = -Wall -O0 -ggdb -Wno-unused-function
LFLAGS = 
INCLUDES = -Iinc -I/usr/include/aravis-0.8 -I/usr/include/glib-2.0 -I/usr/lib/x86_64-linux-gnu/glib-2.0/include

# Ausgabe Ordner des Build Prozesses
APP_FOLDER = build/out
DEP_FOLDER = build/dep
OBJ_FOLDER = build/obj
ASM_FOLDER = build/asm

SRCS = $(wildcard *.c $(addsuffix /*.c, $(SRC_FOLDERS)))
OBJS = $(addprefix $(OBJ_FOLDER)/, $(notdir $(addsuffix .o, $(basename $(SRCS)))))
DEPS = $(addprefix $(DEP_FOLDER)/, $(notdir $(addsuffix .d, $(basename $(SRCS)))))
ASM = $(addprefix $(ASM_FOLDER)/, $(notdir $(addsuffix .s, $(basename $(SRCS)))))
APP = $(APP_FOLDER)/$(APPNAME)

MAKEFLAGS += -rR
vpath %.c $(SRC_FOLDERS) $(DEP_FOLDER) $(OBJ_FOLDER) $(ASM_FOLDER)

.PHONY: all build

all: build run

build: ${APP_FOLDER} ${OBJ_FOLDER} $(DEP_FOLDER) $(ASM_FOLDER) $(APP)

$(APP): $(OBJS) | $(DEPS) $(ASM)
	$(CC) $(LFLAGS) $^ -o $@ -lglib-2.0 -lgobject-2.0 -laravis-0.8 

$(ASM_FOLDER)/%.s: %.c
	$(CC) $(CFLAGS) -S $< -o $@ $(INCLUDES)

$(OBJ_FOLDER)/%.o: %.c | $(DEPS)
	$(CC) $(CFLAGS) -c $< -o $@ $(INCLUDES)

$(DEP_FOLDER)/%.d: %.c
	$(CC) -MM -MT $(@:$(DEP_FOLDER)%.d=$(OBJ_FOLDER)%.o) -MF $@ $^ $(INCLUDES)

${APP_FOLDER} ${OBJ_FOLDER} $(DEP_FOLDER) $(ASM_FOLDER):  
	-mkdir -p $@

dir: ${APP_FOLDER} ${OBJ_FOLDER} $(DEP_FOLDER) $(ASM_FOLDER)

run: $(APP)
	@echo "############################################################"
	@echo "Starting application.."
	-@./$^

clean:
	-rm -rf build

-include $(wildcard $(DEP_FOLDER)/*.d)
