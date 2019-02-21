%%
"for (init; condition; increment ) {" {

	printf("init;\ndo\n{);
	}

"}" {printf("increment;\n}while(condition)"); }


%%

void main()
{

	yylex();
	
}
