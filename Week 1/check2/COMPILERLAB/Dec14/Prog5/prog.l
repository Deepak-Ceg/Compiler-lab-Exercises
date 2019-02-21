%%
[a-zA-Z_]([a-zA-Z0-9_])* {ECHO; printf("\n");} 
. ;
\n ;
%%


int main()
{
yylex();
return 0;
}
