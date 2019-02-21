%%

" "(a[^aeiou]*e[^aeiou]*i[^aeiou]*o[^aeiou]*u[^aeiou]*) {printf("The string is %s\n",yytext);}
. ;
\n ;

%%
 
int main()
{
yylex();
return 0;
}

