%{
%}

%%


d[a-z]*s$ {printf("%s", yytext);}
. ;

%%


void main()
{

	yylex();
	printf("Helloooo");
	

}


