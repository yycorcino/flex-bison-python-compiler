
%{
    #include <stdlib.h>
    #include "parser.tab.h"
%}

%%

"+"         { return PLUS; }
"-"         { return MINUS; }
"*"         { return MUL; }
"/"         { return DIV; }
"^"         { return POWER; }
"="         { return EQ; }
"#".*       { } /* remove comment */
"("         { return LPARAN; }
")"         { return RPARAN; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
["]         { return *yytext; }

"print"     { return PRINT; }

[a-z]+      { yylval = *yytext; return IDENTIFIER; }
[0-9]+      { yylval = atoi(yytext); return INTEGER; }
[ \t\n]     { } /* remove whitespace */

%%

int yywrap(void) {
    return 1;
}