%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <math.h>
    void yyerror(const char *s);
    void divBy0Err(void);
    int yylex(void);

    int sys[26];
    extern FILE *yyin;
    extern FILE *yyout;
%}

%token PLUS MINUS MUL DIV POWER LT ASSIGN CMP_EQ MINUS_EQ NOT_EQ LPARAN RPARAN LBRACE RBRACE COLON
%token PRINT FOR IN WHILE RANGE IF ELSE SIN COS TAN LOG
%token IDENTIFIER INTEGER STRING

%left PLUS MINUS
%left MUL DIV
%nonassoc UMINUS

/* grammar rules */
%%

program: program statements
       | /* NULL */
       ;

statements: statements statement
          | /* NULL */
          ; 

statement: exp
         | assignmnet_stmt
         | print_stmt
         | for_stmt
         | while_stmt
         | if_else_stmt
         ;

assignmnet_stmt: IDENTIFIER ASSIGN exp { sys[$1] = $3; };

print_stmt: PRINT LPARAN exp RPARAN { printf("%d\n", $3); }

for_stmt: FOR IDENTIFIER IN RANGE LPARAN exp RPARAN COLON statements {
    int cont_till = $6;
    for(int i = 0 + 1; i < cont_till ; i++) {
        printf("%d\n", i);
    }
}

while_stmt: WHILE exp LT exp COLON statements { 
    while ($2 < $4 - 1 ) {
        printf("%d\n", $4 - 1);
        $4 = $4 - 1;
    }
} 

if_else_stmt: IF LPARAN exp NOT_EQ exp RPARAN COLON statements ELSE COLON statements { 
    if ($3 == $5) {
        $8;
    } else {    
        $11;
    } 
}

exp: INTEGER                    { $$ = $1; }
    | IDENTIFIER                { $$ = sys[$1]; }
    | exp PLUS exp              { $$ = $1 + $3; }
    | exp MINUS exp             { $$ = $1 - $3; }
    | exp MUL exp               { $$ = $1 * $3; }
    | exp DIV exp               { $$ = $1 / $3; }
    | exp POWER exp             { $$ = pow($1, $3); }
    | exp MINUS_EQ exp          { $$ = $1 - $3; }
    | SIN LPARAN INTEGER RPARAN { $$ = sin($3); printf("%.2f\n", sin($3)); }
    | COS LPARAN INTEGER RPARAN { $$ = cos($3); printf("%.2f\n", cos($3));}
    | TAN LPARAN INTEGER RPARAN { $$ = tan($3); printf("%.2f\n", tan($3));}
    | LOG LPARAN INTEGER RPARAN { $$ = log($3); printf("%.2f\n", log($3));}    
    | LPARAN exp LPARAN         { $$ = $2; }
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