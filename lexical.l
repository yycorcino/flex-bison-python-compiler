/* Recognize tokens for the Python */

%option noyywrap nodefault yylineno
%{
# include "ast-tree.h"
# include "parser.tab.h"
%}

/* float exponent */
EXP	([Ee][-+]?[0-9]+)

%%
 /* single character ops */
"+" |
"-" |
"*" |
"/" |
"=" |
"|" |
"," |
";" |
":" |
"(" |
")"     { return yytext[0]; }

 /* comparison ops */
">"     { yylval.fn = 1; return CMP; }
"<"     { yylval.fn = 2; return CMP; }
"<>"    { yylval.fn = 3; return CMP; }
"=="    { yylval.fn = 4; return CMP; }
">="    { yylval.fn = 5; return CMP; }
"<="    { yylval.fn = 6; return CMP; }

 /* keywords */

"if"    { return IF; }
"else"  { return ELSE; }
"while" { return WHILE; }
"def"   { return DEF;}

 /* built in functions */
"math.sqrt"  { yylval.fn = B_sqrt; return FUNC; }
"math.exp"   { yylval.fn = B_exp; return FUNC; }
"math.sin"   { yylval.fn = B_sin; return FUNC; }
"math.cos"   { yylval.fn = B_cos; return FUNC; }
"math.tan"   { yylval.fn = B_tan; return FUNC; }
"math.log"   { yylval.fn = B_log; return FUNC; }
"print"      { yylval.fn = B_print; return FUNC; }

 /* debug hack */
"debug"[0-9]+ { debug = atoi(&yytext[5]); printf("debug set to %d\n", debug); }

 /* names */
[a-zA-Z][a-zA-Z0-9]*  { yylval.s = lookup(yytext); return NAME; }

[0-9]+"."[0-9]*{EXP}? |
"."?[0-9]+{EXP}? { yylval.d = atof(yytext); return NUMBER; }

"//".*  
[ \t]   /* ignore white space */ 
\\\n    printf("c> "); /* ignore line continuation */
"\n"    { return EOL; }

.	{ yyerror("Mystery character %c\n", *yytext); }
%%