%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token INIT STATEMENT END
%%
ID:
    WHILE  {printf("Valid nested while loop");}
;
WHILE:
     INIT st END
;
st:
     STATEMENT
    |WHILE
;

%%

void yyerror(char *s) {
printf("INVALID WHILE");
}
int main(void) {
yyparse();
return 0;
}

