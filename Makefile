all:
	flex lexical.l
	bison -d -t -v parser.y
	gcc lex.yy.c parser.tab.c -o compiler -lm