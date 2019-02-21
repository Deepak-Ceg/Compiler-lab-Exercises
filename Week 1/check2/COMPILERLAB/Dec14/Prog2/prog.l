%%

[0-9]+[a-z] {ECHO; printf("\n");}

. ;

\n ;

%%

int main()
{
yylex();
return 0;
}
