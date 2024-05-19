
hello.o: src/hello.c
	gcc -c -Iinc ./src/hello.c

main.o: src/main.c
	gcc -c -Iinc ./src/main.c

hello: main.o hello.o
	gcc main.o hello.o -o hello