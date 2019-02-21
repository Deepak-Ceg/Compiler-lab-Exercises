%{
#include<stdio.h>
int yylex(void);
float output=0;
%}
%union
{
 float dval;
}
%token <dval> NUMBER
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS
%type <dval> state
%type <dval> exp
%type <dval> N
%%
state : exp N {}
 ;
exp : NUMBER {$$=$1;output=$$;}
 | '+' exp exp  {$$=$2+$3;output=$$;}
 | '-' exp exp  {$$=$2-$3;output=$$;}
 | '*' exp exp  {$$=$2*$3;output=$$;}
 | '/' exp exp  {$$=$2/$3;output=$$;} 
 ;
N : {printf(" Output =%f\n",output);}
 ;
%%

