%%

" "([a-z]|[A-Z])*[0-9]([a-z]|[A-Z])* {printf("%s is a valid text\n",yytext);}
\n ;
. ;
%%

int main()
{
yylex();
return 0;
}
