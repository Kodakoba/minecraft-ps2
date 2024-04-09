# _____     ___ ____     ___ ____
#  ____|   |    ____|   |        | |____|
# |     ___|   |____ ___|    ____| |    \    PS2DEV Open Source Project.
#-----------------------------------------------------------------------
# Copyright 2001-2004, ps2dev - http://www.ps2dev.org
# Licenced under Academic Free License version 2.0
# Review ps2sdk README & LICENSE files for further details.
#
# SDK and Toolchain used from PS2SDK under AFL accessed 2024

SRC = $(wildcard src/**.c)

EE_BIN = blocktest.elf
EE_OBJS = $(SRC:.c=.o)
EE_LIBS = -lc -ldebug -lmath3d

all: $(EE_BIN)
	$(EE_STRIP) --strip-all $(EE_BIN)

#main.c:
#	bin2c res/atlas.raw main.c blocktest

clean:
	rm -f $(EE_BIN) $(EE_OBJS)

run: $(EE_BIN)
	ps2client execee host:$(EE_BIN)

reset:
	ps2client reset

include Makefile.pref
include Makefile.eeglobal