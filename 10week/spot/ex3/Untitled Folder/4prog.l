%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
%%
"init; while(condn){" {
printf("Init: %s\n",yytext);
return INIT;
}
"stmt;" {
printf("Stat:%s",yytext);
return STATEMENT;
}
"incr;}" {
printf("End:%s",yytext);
return END;
}
%%
int yywrap(void) {
return 1;
}

