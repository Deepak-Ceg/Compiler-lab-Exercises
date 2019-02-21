
%%
" "([a-z]|[0-9])+"@"[a-z]+".com" {printf("%s is a valid email id\n",yytext);}
\n ;
. ;
%%

int main()
{
yylex();
return 0;
}

