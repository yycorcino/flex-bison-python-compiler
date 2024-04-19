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

%token INTEGER 
%token IDENTIFIER 
%token PLUS 
%token MINUS
%token MUL
%token DIV
%token POWER
%token EQ
%token LPARAN
%token RPARAN
%token LBRACE
%token RBRACE
%token PRINT
%left PLUS MINUS
%left MUL DIV
%nonassoc UMINUS


%%

program: program statements
       | /* NULL */
       ;

statements: exp              { printf("%d\n", $1); }
        | IDENTIFIER EQ exp { sym[$1] = $3; } /* assignment stmt */
        | print_stmt
        ;

print_stmt: PRINT LPARAN exp RPARAN { printf("%d\n", $3); }

exp: INTEGER            { $$ = $1; }
    | exp PLUS exp      { $$ = $1 + $3; }
    | exp MINUS exp     { $$ = $1 - $3; }
    | exp MUL exp       { $$ = $1 * $3; }
    | exp DIV exp       { $$ = $1 / $3; }
    | exp POWER exp     { $$ = pow($1, $3); }
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