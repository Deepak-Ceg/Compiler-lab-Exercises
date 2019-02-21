%%

[a-z] {
yyless(yyleng-1);
printf("%s",yytext);}

%%

int main()
{
yylex();
return 0;
}
