CFLAGS = -03 -Wall
CC = gcc
OBJS = Container-Infrastructure.o
SRCS = Container-Infrastructure.c
.PHONY: test clean

Container-Infrastructure.out: $(OBJS)
	$(CC) -o Container-Infrastructure.out $(CFLAGS) $(OBJS)

Container-Infrastructure.o: $(SRCS)
	$(CC) -c $(CFLAGS) $(OBJS)

test: Container-Infrastructure.out
	@echo "test fork 1GB"
	./Container-Infrastructure.out 1 0
	@echo "test vfork 1GB"
	./Container-Infrastructure.out 1 1

clean:
	@rm -f $(OBJS)
	@rm -f Container-Infrastructure.out
