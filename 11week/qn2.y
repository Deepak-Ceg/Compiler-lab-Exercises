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

statement:logical
	|relational	
	| VARIABLE '=' expr { sym[$1] = $3; }
	;
expr:
	INTEGER { $$ = $1; }
	| VARIABLE {$$ = sym[$1];}
	| expr'+'expr { $$ = $1 + $3; }
	| expr'-'expr { $$ = $1 - $3; }
	| expr'*'expr { $$ = $1 * $3; }
	| expr'/'expr { $$ = $1 / $3; }
	| '(' expr ')' { $$ = $2; }
	| '-' expr { $$ = -$2; }
	;

relational:expr	
	|expr '>' expr { if($1>$3) printf("True\n"); else printf("False\n");}
	|expr '<' expr { if($1<$3) printf("True\n"); else printf("False\n");}
	|expr '>''=' expr { if($1>=$4) printf("True\n"); else printf("False\n");}
	|expr '<''=' expr { if($1<=$4) printf("True\n"); else printf("False\n");}
	|expr '=''=' expr { if($1==$4) printf("True\n"); else printf("False\n");}
	|expr '!''=' expr { if($1!=$4) printf("True\n"); else printf("False\n");}
	|
	;

logical:relational '&''&' relational {if($1&&$4) printf("True\n"); else printf("False\n");}
	|relational '|''|' relational {if($1||$4) printf("True\n"); else printf("False\n");}
 	|
	;




%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}
