%%

"#define"" "[a-zA-Z]*" "[a-zA-Z0-9] {

		printf("Matched:%s", yytext);

}

%%

void main()
{

	yylex();
}

