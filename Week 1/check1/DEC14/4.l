%%

(aa)*(bb)* {printf("%s is the valid string\n",yytext);}

\n ;
. ;

%%

int main()
{
yylex();
return 0;
}
