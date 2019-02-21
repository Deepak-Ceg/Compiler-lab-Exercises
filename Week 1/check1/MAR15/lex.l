%{
	#include<stdio.h>
	#include"y.tab.h"
%}

identifier	[a-zA-Z_][a-zA-Z0-9_]*
int	[-+]?[0-9]+
float	[-+]?[0-9]+(\.[0-9]+)
type	(int|float|char)

%%
{type}	{
	yylval.type = (char*) malloc(sizeof(yytext));
	strcpy(yylval.type, yytext);
	return TYPE;
}

{identifier}	{
	yylval.idname = (char*) malloc(sizeof(yytext));
        strcpy(yylval.idname, yytext);
	return ID;
}
{int}	{
	yylval.intvalue = atoi(yytext);
	return INTNUM;
}
{float}	{
	yylval.floatvalue = atof(yytext);
        return FLOATNUM;
}
[-+/*]	{
	return OP;
}
[{()},\n=]	{
	return *yytext;
}
";"	{
	return END;
}
[\n\t ]	
%%
