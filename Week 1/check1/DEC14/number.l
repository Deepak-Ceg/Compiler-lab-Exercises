%%

" "[0-9]+("."[0-9]+)?("E"("+"|"-")?[0-9]+)? {printf("%s is valid\n",yytext);}

\n ;
. ;

%%

int main()
{
yylex();
return 0;
}
