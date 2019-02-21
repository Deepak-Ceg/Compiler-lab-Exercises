%token INTEGER VARIABLE
%left '<' "<=" '>' ">=" "!=" "=="
%left "&&" "||" "~"
%{
#include<stdio.h>
#include<string.h>
int yylex(void);
void yyerror(char *);
int sym[26];
%}
%%
program:
	program statement '\n'
	|
	;
statement:
	expr
	| VARIABLE'='expr {sym[$1]=$3;}
	;
expr:
	INTEGER {$$=$1;}
	|VARIABLE {$$=sym[$1];}
	| expr'+'expr { $$ = $1 + $3; }
	| expr'-'expr { $$ = $1 - $3; }
	| expr'*'expr { $$ = $1 * $3; }
	| expr'/'expr { $$ = $1 / $3; }
	|'('expr')' { $$ = $2;}
	|expr '<' expr { if($1<$3) { $$=1;printf("true\n"); } else {$$=0; printf("false\n"); } }
  	|expr '<''=' expr { if($1<=$4) { $$=1;printf("true\n"); } else { $$=0;printf("false\n"); } }
	|expr '>' expr { if($1>$3) { $$=1;printf("true\n"); } else { $$=0;printf("false\n"); } }
	|expr '>''=' expr { if($1>=$4) { $$=1;printf("true\n"); } else { $$=0;printf("false\n"); } }
	|expr '=''=' expr { if($1==$4) { $$=1;printf("true\n"); } else { $$=0;printf("false\n"); } }
	|expr '!''=' expr { if($1!=$4) { $$=1;printf("true\n"); } else { $$=0;printf("false\n"); } }
        |expr'&''&'expr { if($1&&$4) { printf("true\n"); } else { printf("false\n"); } }
	|expr'|''|'expr { if($1||$4) { printf("true\n"); } else { printf("false\n"); } }
	|
	;
%%
void yyerror(char *error)
{
printf("%s\n",error);
}
int main(void) {
yyparse();
return 0;
}
