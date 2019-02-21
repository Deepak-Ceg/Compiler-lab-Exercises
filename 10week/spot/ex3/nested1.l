%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
%%
"for(init;condn;incr){" {
printf("Init: %s\n",yytext);
return B;
}
"stmt;" {
printf("Stat:%s",yytext);
return S;
}
"}" {
printf("End:%s",yytext);
return E;
}
%%
int yywrap(void) {
return 1;
}

