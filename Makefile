all:
	bison -t -d -v parser.y
	flex lexical.lex
	g++ lex.yy.c parser.tab.c -lfl