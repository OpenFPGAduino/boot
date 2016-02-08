# Makefile for building keil projects
KEIL=wine "/home/zhizhouli/.wine/drive_c/Keil_v5/UV4/UV4.exe"
TMP=/tmp/keil.out
NULL=/dev/null

# Will prevent it from exiting even when somehing failied
all:
	-@$(KEIL) -j0 -b -o $(TMP) keil/mboot.uvproj 2> $(NULL);
	@cat $(TMP)

clean:
	rm -f keil/output
	rm boot.bin

format:
	find . -name "*.c" -exec astyle -n {} \;
	find . -name "*.h" -exec astyle -n {} \;	 


