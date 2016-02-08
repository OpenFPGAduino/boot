CFLAGS = -D _DEBUG -static -g  -Wall
CC=arm-none-linux-gnueabi-gcc
AR=arm-none-linux-gnueabi-ar
SRC=$(wildcard src/*.c src/fatfs/*.c src/drivers/*.c)
OBJ=$(addprefix ./, $(addsuffix .o, $(basename $(SRC))))
INC=-I src/drivers/ -I src/fatfs/ -I src/boot -I src/
TARGET=boot.bin

all: $(TARGET)

$(TARGET): $(OBJ)
	#$(CC) $^ -o $@
	$(AR) -rcs $@ $^
	
%.o: %.c
	$(CC) $(CFLAGS) $(INC) -o $@ -c $<

clean:
	rm -f $(TARGET) $(SO) $(OBJ)

format:
	find . -name "*.c" -exec astyle -n {} \;
	find . -name "*.h" -exec astyle -n {} \;	 

# Makefile for building keil projects
KEIL=wine "/home/bliker/.wine/drive_c/Keil/UV4/UV4.exe"
TMP=/tmp/keil.out
NULL=/dev/null

# Will prevent it from exiting even when somehing failied
build:
	-@$(KEIL) -j0 -b -o $(TMP) *.uvproj 2> $(NULL);
	@cat $(TMP)

