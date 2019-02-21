%token INTEGER VARIABLE
%left '+' '-'
%left '*' '/'

%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
int sym[26];

%}
%%
program : program expr '\n' {printf("\nValid Variable!");}  
	|     
	;

expr:
	VARIABLE expr2
	|
	;
expr2:
	VARIABLE expr2
	| INTEGER expr2
	| VARIABLE 
	| INTEGER
	|
	;

%%
void yyerror(char *s) {
printf("\nInvalid Variable");
}
int main(void) {
yyparse();
return 0;
}
