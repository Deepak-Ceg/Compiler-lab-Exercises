%%

" "[0-9]* yymore();

" "[a-z]* yymore();

\n {printf("%s",yytext);}

. yyless(yyleng-1);

%%

int main()
{
yylex();
return 0;
}
