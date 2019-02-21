%{
#include <stdio.h>
int yylex(void);
void yyerror(char *);
%}
%token B S E
%%
ID:
    F'\n' {printf("Valid nested for loop");}
;
F:
     B st E
;
st:
     S
    |F
;

%%

void yyerror(char *s) {
fprintf(stderr, "%s\n", s);
}
int main(void) {
yyparse();
return 0;
}

