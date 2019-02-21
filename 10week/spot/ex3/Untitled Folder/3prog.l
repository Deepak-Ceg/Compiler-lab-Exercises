%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
%%
"for(init;condn;incr){" {
printf("Init: %s\n",yytext);
return INIT;
}
"stmt;" {
printf("Stat:%s",yytext);
return STATEMENT;
}
"}" {
printf("End:%s",yytext);
return END;
}
%%
int yywrap(void) {
return 1;
}

