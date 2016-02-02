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
