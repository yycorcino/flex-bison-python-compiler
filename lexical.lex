%{
    /* definitions */
    #include <stdio.h>
    #include "parser.tab.h"
%}


/* rules */
%%

[0-9]+  { return NUMBER; }
[a-z]+  { return IDENTIFIER; }
[ \t\n] {}

%%
