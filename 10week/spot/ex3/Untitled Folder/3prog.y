%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token INIT STATEMENT END
%%
ID:
    FOR  {printf("Valid nested for loop");}
;
FOR:
     INIT statement END
;
statement:
     STATEMENT
    |FOR
;

%%

void yyerror(char *s) {
printf("INVALID FOR");
}
int main(void) {
yyparse();
return 0;
}

