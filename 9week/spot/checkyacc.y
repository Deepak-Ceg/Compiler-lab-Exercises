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
program:
	program statement '\n'  
	|
	;

statement:
	expr { printf("\nInfix"); }
	| VARIABLE '=' expr { sym[$1] = $3; }
	| expr1 { printf("\nPost fix"); }
	| expr2 { printf("\nPre fix"); }
	;
expr:
	INTEGER { $$ = $1; }
	| VARIABLE {$$ = sym[$1];}
	| expr'+'expr { $$ = $1 + $3; }
	| expr'-'expr { $$ = $1 - $3; }
	| expr'*'expr { $$ = $1 * $3; }
	| expr'/'expr { $$ = $1 / $3; }
	| '(' expr ')' { $$ = $2; }
	;
expr1:
	INTEGER { $$ = $1; }
	| VARIABLE {$$ = sym[$1];}
	| expr1 expr1 '+' { $$ = $1 + $3; }
	| expr1 expr1 '-' { $$ = $1 - $3; }
	| expr1 expr1 '*' { $$ = $1 * $3; }
	| expr1 expr1 '/' { $$ = $1 / $3; }
	| '(' expr1 ')' { $$ = $2; }
	;


expr2:
	INTEGER { $$ = $1; }
	| VARIABLE {$$ = sym[$1];}
	| '+' expr2 expr2  { $$ = $1 + $3; }
	| '-' expr2 expr2 { $$ = $1 - $3; }
	| '*' expr2 expr2 { $$ = $1 * $3; }
	| '/' expr2 expr2 { $$ = $1 / $3; }
	| '(' expr2 ')' { $$ = $2; }
	;
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}
