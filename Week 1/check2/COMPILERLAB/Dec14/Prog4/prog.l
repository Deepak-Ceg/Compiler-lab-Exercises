%%
(a|b)*(abb) {ECHO; printf("\n");}
. ;
\n ;
%%
int main()
{
yylex();
return 0;
}
