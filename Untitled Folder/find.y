%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token INTEGER
%left '+' '-'
%left '*' '/'
%%
program:
program statement
|
;
statement:
	expr '\n' { printf("Prefix \n" ); }
	| expr1 '\n' { printf("Postfix \n"  ); }
	| expr2 '\n' { printf("Infix \n"  ); }
	;

expr:
INTEGER		  { $$ = $1; }
| '+' expr expr   { $$ = $2 + $3; }
| '-' expr expr   { $$ = $2 - $3; }
| '*' expr expr   { $$ = $2 * $3; }
| '/' expr expr   { $$ = $2 / $3; }
| '(' expr ')' 	  { $$ = $2; }
;
expr1:
INTEGER		  { $$ = $1; }
| expr1 expr1 '+' { $$ = $1 + $2; }
| expr1 expr1 '-' { $$ = $1 - $2; }
| expr1 expr1 '*' { $$ = $1 * $2; }
| expr1 expr1 '/' { $$ = $1 / $2; }
| '(' expr1 ')'   { $$ = $2; }
;
expr2:
INTEGER		    { $$ = $1; }
| expr2 '+' expr2   { $$ = $1 + $3; }
| expr2 '-' expr2   { $$ = $1 - $3; }
| expr2 '*' expr2   { $$ = $1 * $3; }
| expr2 '/' expr2   { $$ = $1 / $3; }
| '(' expr2 ')'     { $$ = $2; }
;
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}
