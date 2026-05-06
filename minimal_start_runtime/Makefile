CC = gcc

CFLAGS = -nostdlib -nostartfiles -no-pie

all:
	$(CC) $(CFLAGS) minimal_start.s minimal_main.c \
	-T linker.ld -o app

run: all
	./app

clean:
	rm -f app
