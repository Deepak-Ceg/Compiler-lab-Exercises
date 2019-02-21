%token INTEGER VARIABLE
%left '*' '/'
%left '+' '-'

%{
	#include<stdio.h>
	void yyerror(char *);
	int yylex(void);
	int sym[26];
%}

%%
program: program statement '\n'{if($2) printf("True\n"); else printf("False\n");}
	|	
	;

statement: expr
	| VARIABLE '=' expr {sym[$1] = $3;}
	;

expr: INTEGER
	| VARIABLE {$$ = sym[$1];}
	| expr '+' expr {$$ = $1 + $3;}
	| expr '-' expr {$$ = $1 - $3;}
	| expr '*' expr {$$ = $1 * $3; /*printf("%d\n",$$);*/}
	| expr '/' expr {$$ = $1 / $3;}
	| expr '&''&' expr {$$ = $1 && $4;}
	| expr '|''|' expr {$$ = $1 || $4;}
	| '!' expr {$$ = !$2;}
	| '(' expr ')' {$$ = $2;}
	| expr '<' expr {$$ = ($1 < $3);}
	| expr '>' expr {$$ = ($1 > $3);}
	| expr '<''=' expr {$$ = ($1 <= $4);}
	| expr '>''=' expr {$$ = ($1 >= $4);}
	| expr '=''=' expr {$$ = ($1 == $4);}
	| expr '!''=' expr {$$ = ($1 != $4);}
	;
%%

void yyerror(char *s){
	fprintf(stderr,"%s\n",s);
}

int main(void){
	yyparse();
	return 0;
}
