CXX=g++
CXXFLAGS=-c -Wall -lmingw32 -lSDL2main -lSDL2 -mwindows
LDFLAGS=-lmingw32 -lSDL2main -lSDL2 -mwindows
SRCP=src
OBJP=obj
SRC:=main.cpp vector.cpp
OBJ:=$(SRC:%.cpp=%.o)
SRC:=$(addprefix $(SRCP)/, $(SRC))
OBJ:=$(addprefix $(OBJP)/, $(OBJ))
RC=.rc
ICON=icon.ico
BINP=bin
RES=data.res
EXEC=game.exe

all: dirs $(OBJ) $(EXEC)

$(EXEC): $(OBJ) $(RES)
	$(CXX) $(OBJ) $(OBJP)/$(RES) -o $(BINP)/$(EXEC) $(LDFLAGS)

$(OBJP)/%.o: $(SRCP)/%.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

$(RES): $(ICON) $(RC)
	windres $(RC) -O coff -o $(OBJP)/$(RES)

dirs:
	mkdir -p $(OBJP)
	mkdir -p $(BINP)

clean:
	rm -rf *.o $(OBJP) $(BINP) 
