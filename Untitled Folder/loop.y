%token WHILE FOR INTEGER VARIABLE
%left '+' '-'

%{
#include<stdio.h>
void yyerror(char *);
int yylex(void);
int sym[26];
%}

%%
program: WHILE '(' comp ')' '{' '\n' program '\n' '}' '\n''\n' {printf("valid while loop\n");}
	| FOR '(' initial ';' comp ';' incre ')' '{' '\n' program '\n' '}' '\n''\n' {printf("valid for loop\n");}
	| statement
	| 
	;
statement: var ';' '\n' program
	| '}'
	|
	;
var: INTEGER
	| VARIABLE var
	| var '=' var
	| var '+' var
	| var '-' var
	| var '*' var
	| var '/' var
	| var '+' '+'
	| var '-' '-'
	|
	;
initial: VARIABLE '=' INTEGER
	| VARIABLE '=' VARIABLE
	;

incre: VARIABLE '+''+'
	| VARIABLE '-''-'
	;
comp: VARIABLE '>' VARIABLE 
	| VARIABLE '>' INTEGER
	| VARIABLE '<' VARIABLE
	| VARIABLE '<' INTEGER
	| VARIABLE '>''=' INTEGER
	| VARIABLE '>''=' VARIABLE
	| VARIABLE '<''=' VARIABLE
	| VARIABLE '<''=' INTEGER
	| VARIABLE '=''=' VARIABLE
	| VARIABLE '=''=' INTEGER
	| VARIABLE '!''=' VARIABLE
	| VARIABLE '!''=' INTEGER
	;
%%

void yyerror(char *s){
	fprintf(stderr,"%s\n",s);
	return 0;
}

int main(void){
	yyparse();
	return 0;
}
