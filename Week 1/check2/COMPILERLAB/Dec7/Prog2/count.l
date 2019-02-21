
letter [a-z]
digit [0-9]
%%

" "({letter}|{digit})+"@"[a-z]+".com" {ECHO;}
. ;
\n ;

%%

void yyerror()
{
printf("Error\n");

}

int main()
{
yylex();
printf("\n");
return 0;
}
