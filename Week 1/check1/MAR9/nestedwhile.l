%{
#include <stdlib.h>
#include<stdio.h>
void yyerror(char *);
#include "y.tab.h"
%}
alpha [A-Za-z]
digit [0-9]
%%
[\t\n]
while {yylval=*yytext;return WHILE;}
{digit}+ return NUM;
{alpha}({alpha}|{digit})* return ID;
"<=" {yylval=*yytext;return LE;}
">=" {yylval=*yytext;return GE;}
"==" {yylval=*yytext;return EQ;}
"!=" {yylval=*yytext;return NE;}
"||" {yylval=*yytext;return OR;}
"&&" {yylval=*yytext;return AND;}
. {return yytext[0];}
%%
int yywrap(void) {
return 1;
}
