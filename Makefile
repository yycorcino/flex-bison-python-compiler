all:
	bison -d fb3-2.y
	flex -ofb3-2.lex.c fb3-2.l
	gcc -o $@ fb3-2.tab.c fb3-2.lex.c fb3-2func.c -lm

clean:
	rm all fb3-2.lex.c fb3-2.tab.c fb3-2.tab.h