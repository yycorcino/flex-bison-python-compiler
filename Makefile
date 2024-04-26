all:
	bison -d parser.y
	flex -o lexical.lex.c lexical.l
	gcc -o interpreter parser.tab.c lexical.lex.c ast-tree.c -lm

clean:
	rm interpreter lexical.lex.c parser.tab.c parser.tab.h