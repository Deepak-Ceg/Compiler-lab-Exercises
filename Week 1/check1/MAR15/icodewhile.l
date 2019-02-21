ALPHA [A-Za-z]
DIGIT [0-9]
%{
#include<stdio.h>
#include "y.tab.h"
%}
%%
while                {return WHILE; }
{ALPHA}({ALPHA}|{DIGIT})*    {return ID;}
{DIGIT}+             {yylval=atoi(yytext); return NUM;}
[ \t]                 {}
\n                {}
.                 {return yytext[0];}
%%
