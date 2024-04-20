%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    void yyerror(const char *s);
    void divBy0Err(void);
    int yylex(void);

    int sym[26];
    extern FILE *yyin;
    extern FILE *yyout;
%}

%define parse.error verbose /* make error print more defined */

%token PLUS MINUS MUL DIV POWER ASSIGN CMP_EQ LPARAN RPARAN LBRACE RBRACE COLON
%token PRINT FOR IN WHILE RANGE TRUE FALSE
%token IDENTIFIER INTEGER STRING

%left PLUS MINUS
%left MUL DIV
%nonassoc UMINUS

%%

program: program statements
       | /* NULL */
       ;

statements: exp              { printf("%d\n", $1); }
        | IDENTIFIER ASSIGN exp { sym[$1] = $3; } /* assignment stmt */
        | print_stmt
        | for_stmt
        ;

print_stmt: PRINT LPARAN exp RPARAN { printf("%d\n", $3); }

for_stmt: FOR IDENTIFIER IN RANGE LPARAN exp RPARAN COLON statements {
    int continue_for = $6;
    for(int i = 0 ; i < continue_for ; i++) {;
        $9; /* excutes the statement in the give scope */
    }
}

/* while_stmt: WHILE IDENTIFIER COLON statements { 
    int i;
    for(i=$2 ; i<$5 ; i++) {printf("%dth Loop's expression value: %d\n", i,$8);}
} */

exp: INTEGER            { $$ = $1; }
    | TRUE              { $$ = 1; }
    | FALSE             { $$ = 0; }
    | exp PLUS exp      { $$ = $1 + $3; }
    | exp MINUS exp     { $$ = $1 - $3; }
    | exp MUL exp       { $$ = $1 * $3; }
    | exp DIV exp       { $$ = $1 / $3; }
    | exp POWER exp     { $$ = pow($1, $3); }
    | '"' IDENTIFIER '"' { $$ = $2; }
    | LPARAN exp LPARAN { $$ = $2; }
    ;

%%

void yyerror(const char *s) { printf("Parser Error: %s\n", s); }

void divBy0Err(void) { printf("Error: division by zero\n"); exit(0); }

int main(int argc, char *argv[]) {

    // parse given file
    int out;
    yyin = fopen(argv[1], "r");
    out = yyparse();
    fclose(yyin);
    
    return out;
}