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
RES=$(OBJP)/data.res
EXEC=$(BINP)/game.exe

all: dirs $(OBJ) $(EXEC)

$(EXEC): $(OBJ) $(RES)
	$(CXX) $(OBJ) $(RES) -o $(EXEC) $(LDFLAGS)

$(OBJP)/%.o: $(SRCP)/%.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

$(RES): $(ICON) $(RC)
	windres $(RC) -O coff -o $(RES)

dirs:
	mkdir -p $(OBJP)
	mkdir -p $(BINP)

clean:
	rm -rf *.o $(OBJP) $(BINP) 
