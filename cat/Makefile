FLAGS = -Wall -Wextra -Werror

my_cat: my_cat.h my_cat.c
	gcc $(FLAGS) my_cat.c -o my_cat
	
clang:
	clang-format -n *.c *.h
	clang-format -i *.c *.h

rebuild: all

clean: 
	rm -rf my_cat

test: all
	bash test.sh

all: clean my_cat
