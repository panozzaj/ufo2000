CC = g++
LD = g++
CFLAGS = -funsigned-char -Wall
CFLAGS += -pipe -DLINUX
#CFLAGS += -g -mcpu=i686 -s -fomit-frame-pointer
CFLAGS += -ggdb
INCLUDES = ${shell /tmp/alg/bin/allegro-config --cflags}
CFLAGS += $(INCLUDES)
LIBS = $(addprefix -l,$(LIBRARIES)) ${shell /tmp/alg/bin/allegro-config --libs debug}

OBJS = about.o bullet.o cell.o config.o connect.o dirty.o editor.o explo.o \
       font.o icon.o inventory.o item.o keys.o main.o mainmenu.o \
       map.o map_pathfind.o multiplay.o netdplay.o netipx.o netmdm.o netsock.o \
       packet.o pck.o place.o platoon.o soldier.o sound.o spk.o \
       terrapck.o units.o video.o wind.o word.o crc32.o persist.o jpeg.o pfxopen.o

SRCS_DIR = ./src

NAME = ufo2000

all:  makefile.dep $(NAME)

%.o: $(SRCS_DIR)/%.cpp
	$(CC) $(CFLAGS) -c $< -o $@

$(NAME): $(OBJS)
	$(LD) $(CFLAGS) -o $@ $^ $(LIBS)

clean:
	$(RM) *.o
	$(RM) $(NAME)
	$(RM) makefile.dep

#makefile.dep: $(SRCS_DIR)/*.cpp $(SRCS_DIR)/*.h
#	$(RM) makefile.dep
#	g++ -MM -DLINUX $(INCLUDES) $(SRCS_DIR)/*.cpp >> makefile.dep

-include makefile.dep
