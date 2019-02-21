%{
#include<stdio.h>
#include<stdlib.h>
void yyerror(char *);
int yylex(void);
%}
%token ID NUM FOR LE GE EQ NE AND OR
%right '='
%left OR AND
%left '<' '>' LE GE EQ NE
%left '+' '-'
%left '*' '/'
%%
S: ST {printf("input accepted\n");exit(0);}
ST: FOR'('E';'E2';'E')'
E: ID '=' E
|E'+'E
|E'-'E
|E'*'E
|E'/'E
|E LE E
|E GE E
|E NE E
|E'>'E
|E'<'E
|E EQ E
|E AND E
|E OR E
|E '+' '+'
|E'-''-'
|ID
|NUM
;
E2:E '<' E
|E'>'E
|E LE E
|E GE E
|E EQ E
|E NE E
|E OR E
|E AND E
;
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s);

}
int main(void) {
yyparse();
return 0;
}
