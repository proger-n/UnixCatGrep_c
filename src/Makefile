my_cat: my_cat.o
	gcc my_cat.o -o cat/my_cat.out
	rm -rf *.o

my_cat.o: cat/my_cat.c
	gcc -c -Wall -Werror -Wextra cat/my_cat.c

my_grep: my_grep.o
	gcc my_grep.o -o grep/my_grep.out
	rm -rf *.o

my_grep.o: grep/my_grep.c
	gcc -c -Wall -Werror -Wextra grep/my_grep.c

clean:
	rm -rf cat/*.out
	rm -rf grep/*.out
