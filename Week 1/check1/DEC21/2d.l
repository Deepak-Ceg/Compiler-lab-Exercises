%%

([0-9]0?1?2?3?4?5?6?7?8?9?[0-9]) {printf("The string is %s\n",yytext);}
.* ;
\n ;

%%
 
int main()
{
yylex();
return 0;
}

