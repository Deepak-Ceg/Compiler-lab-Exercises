
pattern (ab)+ 
%%

{pattern} {printf("Valid");}
.* {printf("Not Valid");}

%%

void main()
{
yylex();

}



