%%
[0-9]([0-9])*("."([0-9]*)("E"[+|-]([0-9]+))?)?  {ECHO; printf("\n");}
. ;
\n ;
%%
int main()
{
yylex();
return 0;
}
