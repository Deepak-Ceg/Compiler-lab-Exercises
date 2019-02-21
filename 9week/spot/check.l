%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.c"
%}
%%
[a-z] {
	yylval = *yytext - 'a';
	return VARIABLE;
	}

	
[-+()=/*\n] return *yytext;
[ \t] ; /* skip whitespace */
. yyerror("invalid character");

%%
int yywrap(void) {
return 1;
}
