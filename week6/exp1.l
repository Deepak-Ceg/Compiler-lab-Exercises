%%
"while" {

	yytext ="for";
	printf("%s", yytext);
	}

"(" {printf("%s;",yytext);}
")" {printf(";%s", yytext);}


%%

void main()
{

	yylex();
	
}
