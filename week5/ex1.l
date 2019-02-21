dig [0-9]
let [a-zA-Z]
id {let}({let}|{dig})*
op [+\-]
assig [=]
%{
int idcount=0, opcount=0, pre=0,post=0,assi=0;
%}

%%
{op}*{id}{op}* {idcount++;printf("\n identifier %s", yytext); } 
{let}*{op}+{let}* {opcount++; printf("\nOperator %s", yytext); REJECT;}
{op}+{let} {pre++; printf("\nPrefix: %s", yytext);}
{let}{op}+ {post++; printf("\nPostFix: %s", yytext);}
{let}*{assig} {assi++; printf("\nAssignment %s", yytext);}
%%

int main()
{ 	 	 	
	yylex();
	printf("\nIdentifier %d",idcount);
	printf("\nOperator %d",opcount);
	printf("\nPrefix %d", pre);
	printf("\nPostfix %d", post);
	printf("\nAssignment %d", assi);
	return 0;
}
