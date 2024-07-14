CC = gcc -I ./include
CFLAGS = -std=gnu99 -Wall -g #-DDEBUG

#CC = g++ -I ./include
#CFLAGS = -std=c++20 -Wall -g #-DDEBUG

INC = ./include
SRC = ./src
OBJ = ./obj
DOC = ./doc
BIN = ./bin

vpath %.h ./include
vpath %.c ./src

#vpath %.hpp ./include
#vpath %.cpp ./src

EXECS = main

all: mkpaths $(EXECS)

mkpaths:
	@ mkdir -p $(OBJ)
	@ mkdir -p $(BIN)
doc:
	doxygen

main: main.c
	@ mkdir -p $(BIN)
	$(CC) $(CFLAGS) $(SRC)/main.c -o $(BIN)/$@

#main: main.cpp
#	@ mkdir -p $(BIN)
#	$(CC) $(CFLAGS) $(SRC)/main.cpp -o $(BIN)/$@

.PHONY: clean
clean:
	/bin/rm -rf $(BIN)/* $(OBJ)/* core* *~ $(SRC)/*~ $(INC)/*~ $(DOC)/*

