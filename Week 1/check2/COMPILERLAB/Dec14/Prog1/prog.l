letter [a-z]
digit [0-9]

%%

[a-z]*[0-9][a-z]* {ECHO; printf("\n");}

. ;

\n ;

%%

int main()
{
yylex();

return 0;
}
