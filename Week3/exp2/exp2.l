%{

%}


%%

[d][a-zA-Z]*[s]$ {printf(" hiii you're correct! %s", yytext);}

%%

void main()
{
	yylex();

}



