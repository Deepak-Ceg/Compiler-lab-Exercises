%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
%%
[a-z] {
yylval = yytext[0];
return INTEGER;
}
[-+*/()\n] return *yytext;
[ \t] ; /* skip whitespace */
. yyerror("invalid character");
%%
int yywrap(void) {
return 1;
}
