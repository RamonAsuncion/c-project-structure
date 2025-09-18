CFLAGS=-Isrc -Wall -Wextra # -g -DDEBUG
SRC=src
BIN=bin

main: src/main.c | mkbin
	$(CC) $(CFLAGS) src/main.c -o $(BIN)/main

mkbin:
	@ mkdir -p $(BIN)

doc:
	doxygen

.PHONY: main mkbin doc clean
clean:
	@ rm -rf $(BIN)/* core* *~ src/*~ docs/* *.dSYM

