# Makefile for building keil projects
KEIL=wine UV4.exe
TMP=/tmp/keil.out
NULL=/dev/null

# Will prevent it from exiting even when somehing failied
all:
	-@$(KEIL) -j0 -b -o $(TMP) keil/mboot.uvproj 2> $(NULL);
	@cat $(TMP)

clean:
	rm -rf keil/output
	rm boot.bin

format:
	find . -name "*.c" -exec astyle -n {} \;
	find . -name "*.h" -exec astyle -n {} \;	 


