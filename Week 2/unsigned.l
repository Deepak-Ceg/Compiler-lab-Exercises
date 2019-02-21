%{

%}


%%
[.]?[0-9]+(\.|[0-9]+)?([eE][+|\-][0-9]+)? {printf("Yes");}
[.]* {printf("No");}
%%

int main(void)
{

	yylex();
	return 0;

}


