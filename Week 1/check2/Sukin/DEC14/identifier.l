%%

((([a-z]|[A-Z])_)*|[0-9]*)* {printf("%s is a valid string\n",yytext);}

\n ;
. ;

%%

int main()
{
yylex();
return 0;
}
