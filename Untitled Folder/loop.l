%{
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}

%%
"while" {
	yylval = *yytext - 'a';
	return WHILE;
}

"for" {
	yylval = *yytext - 'a';
	return FOR;
}

[a-zA-Z] {
	yylval = *yytext - 'a';
	return VARIABLE;
}

[0-9] {
	yylval = atoi(yytext);
	return INTEGER;
}

[-{}()=+;\n] return *yytext;

("<"|"<="|">"|">="|"=="|"!=") return *yytext;

[ \t] ;

. yyerror("Invalid character");
%%
