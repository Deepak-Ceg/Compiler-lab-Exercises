%%

[0-9]+([a-z]|[A-Z]) {printf("%s is the required pattern\n",yytext);}
\n ;
. ;

%%

int main()
{
yylex();
return 0;
}
