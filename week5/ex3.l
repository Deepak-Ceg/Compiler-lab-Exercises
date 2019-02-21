lower [a-z]

%{


%}

%%

{lower} {printf("%s", yymore()); }

%%


void main()
{

	yylex();

}



