CC=g++
CFLAGS=-c -Wall -lmingw32 -lSDL2main -lSDL2 -mwindows
LDFLAGS=-lmingw32 -lSDL2main -lSDL2 -mwindows
SRC=main.cc vector.cc
OBJ=$(SRC:.cc=.o)
RC=.rc
RES=data.res
ICON=icon.ico
EXEC=game.exe

all: $(SRC) $(EXEC)

$(EXEC): $(OBJ) $(RES)
	$(CC) $(OBJ) $(RES) -o $(EXEC) $(LDFLAGS)

%.o: %.cc
	$(CC) $(CFLAGS) $<

$(RES): $(ICON) $(RC)
	windres $(RC) -O coff -o $(RES)

clean:
	rm -f *.o $(RES) $(EXEC)
