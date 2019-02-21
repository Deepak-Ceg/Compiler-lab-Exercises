%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}
%%
"init; while(condn){" {
printf("Init: %s\n",yytext);
return B;
}
"stmt;" {
printf("Stat:%s",yytext);
return S;
}
"incr;}" {
printf("End:%s",yytext);
return E;
}
%%
int yywrap(void) {
return 1;
}

