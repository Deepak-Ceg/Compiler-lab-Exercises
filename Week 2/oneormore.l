oppref ([+\-])?
number {oppref}[0-9]+
%%

^{number}$ {printf("Valid");}
.* {printf("Not Valid");}

%%

void main()
{
yylex();

}



