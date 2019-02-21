%{
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}

%%

[0-9]+ { 
             yylval = atoi(yytext);
	     return INTEGER;
       }



[a-z]+ {
	     yylval= *yytext;	
	     return ID;			
}

[-+*/\n] return *yytext;

[\t] ;
 
. yyerror("Invalid Character");

%%

int yywrap(void)
{
return 1;
}
