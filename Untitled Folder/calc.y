%{
#include<stdio.h>
#include<ctype.h>
int regs[26];
int base;
%}
%start list
%token DIGIT LETTER
%left '+' '-'
%left '*' '/' '%'
%left UMINUS

%%
list:
	|list stat '\n'
	| list error '\n'
		{ yyerrok;}
	;
stat: expr { printf("%d\n",$1);}
	|LETTER '+' expr
{
regs[$1]=$3;}
;
number: DIGIT 	{$$=$1; base=($1==0)? 8:10;}
|number DIGIT	{$$=base*$1+$2;}
;
expr :	| expr '+' expr	{$$=$1+$3; }
	| expr '-' expr	{$$=$1-$3; }
	| expr '*' expr	{$$=$1*$3; }
	| expr '/' expr	{$$=$1/$3; }
	| '(' expr ')'	{$$=$2;	}
	| LETTER {$$=regs[$1];}
	| number
	;
%%
yylex()
{
int c;
while((c=getchar())==' ')
if(islower(c)){
yylval=c-'a';
return (LETTER);
}
if(isdigit(c)){
yylval=c-'0';
return (DIGIT);
}
return(c);
}
