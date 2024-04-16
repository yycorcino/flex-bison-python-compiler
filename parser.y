%{
    /* definitions */
    #include <stdio.h>

    int yylex();
    void yyerror(const char *s);
%}

%token IDENTIFIER
%token NUMBER

%start program

%%
program: IDENTIFIER NUMBER IDENTIFIER NUMBER {printf("program -> IDENTIFIER NUMBER IDENTIFIER NUMBER\n");}
%%

int main(void) {
    // bob 123 alice 321
    yyparse();
}

void yyerror(const char *s) {
    printf("Error: %s\n", s);
}