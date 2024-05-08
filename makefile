CC = gcc
DEBUG = -g
CFLAGS = -Wall -std=c99 -pedantic -c $(DEBUG)
LFLAGS = -Wall -std=c99 -pedantic -lpthread $(DEBUG)

main.out: main
	./main | tee main.out

main: get_student_id.o main.o
	$(CC) $(LFLAGS) get_student_id.o \
	main.o -o main

main.o: main.c
	$(CC) $(CFLAGS) main.c

 get_student_id.o: get_student_id.c
	$(CC) $(CFLAGS) get_student_id.c

clean:
	\rm *.o main
