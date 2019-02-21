%token INTEGER VARIABLE
%left '+' '-'
%left '*' '/'
%{
        #include <stdio.h>
        void yyerror(char *);
        int yylex(void);
        int sym[26];
%}
%%
program:
        program statement '\n'
        |
        ;
statement:
        expr
        | VARIABLE '=' expr     { sym[$1] = $3; }
        ;

expr:
        INTEGER { $$ = $1; }
        | expr '+' expr { $$ = $1 + $3; }
        | expr '-' expr { $$ = $1 - $3; }
        | expr '*' expr { $$ = $1 * $3; }
        | expr '/' expr { $$ = $1 / $3; }
        | '(' expr ')'  { $$ = $2; }
        ;
%%
void yyerror(char *s) {
        printf("%s\n", s);
}
int main(void) {
        yyparse();
        return 0;
}

