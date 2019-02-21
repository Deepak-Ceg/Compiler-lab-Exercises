%%

[a|b]*"abb" {printf("%s is a valid string\n",yytext);}

\n ;
. ;

%%

int main()
{
yylex();
return 0;
}
