%{
#include<stdio.h>
#include<stdlib.h>
int yylex();
void yyerror(char*);

%}
%token NUM;
%token LE;
%token GE;
%token EE;
%token NE;
%%

prog: prog expr '\n'   { printf("%d\n",$2);}
      |   ;

expr: NUM    {$$=$1;}
      | expr '<'  expr  {if($1<$3) { $$=1; } else { $$=0; } }
      | expr '>' expr  { if($1>$3) { $$=1; } else { $$=0; } }
      | expr LE  expr { if($1<=$3) { $$=1;} else { $$=0; } }
      | expr GE expr { if($1>=$3) { $$=1;} else { $$=0; } }
      | expr EE expr { if($1==$3) { $$=1;} else { $$=0; } }
      | expr NE expr { if($1!=$3) { $$=1;} else { $$=0; } }
                ;

%%


void yyerror (char *s)
{
fprintf(stderr,"%s\n",s);
}
int main()
{
yyparse();
return 0;
}
