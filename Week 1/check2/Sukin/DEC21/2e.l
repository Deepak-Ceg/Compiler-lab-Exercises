%%

" "(aa)*b(bb)* {printf("The string is %s\n",yytext);}
.* ;
\n ;

%%
 
int main()
{
yylex();
return 0;
}

