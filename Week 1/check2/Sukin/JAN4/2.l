%%

" "(([+]|[-]|[*]|[/])[a-z]+)* {printf("%s is a prefix expression\n",yytext);}

" "([a-z]+([+]|[-]|[*]|[/]))* {printf("%s is a postfix expression\n",yytext);}

" "([a-z]+([+]|[-]|[*]|[/])[a-z]+)* {printf("%s is a infix expression\n",yytext);}

. ;

\n ;

%%

int main()
{
yylex();
return 0;
}
