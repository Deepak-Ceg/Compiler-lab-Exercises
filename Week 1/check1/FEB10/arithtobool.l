let [a-zA-Z]
dig [0-9]
%{
#include<stdio.h>

%}
%%
"+" {printf("|");}
"*" {printf("&");}
. {printf("%s",yytext); }

%%
int main()
{
yylex();
return 0;
}                 
