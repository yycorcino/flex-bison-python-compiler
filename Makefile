all:
	flex lexical.l
	bison -d -t -v parser.y
	gcc lex.yy.c parser.tab.c -o compiler -lm

clean:
	rm compiler lex.yy.c parser.output parser.tab.c parser.tab.h