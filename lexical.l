
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
"="         { return ASSIGN; }
"=="        { return CMP_EQ; }
"("         { return LPARAN; }
")"         { return RPARAN; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
":"         { return COLON; }
["]         { return *yytext; }
"#".*       { } /* remove comment */

"print"     { return PRINT; }
"for"       { return FOR; }
"in"        { return IN; }
"while"     { return WHILE; }
"range"     { return RANGE; }
"True"      { return TRUE; }
"False"     { return FALSE; }

[a-zA-Z][a-zA-Z0-9]*      { yylval = *yytext; return IDENTIFIER; }
[0-9]+      { yylval = atoi(yytext); return INTEGER; }
[ \t\n]     { } /* remove whitespace */

%%

int yywrap(void) {
    return 1;
}