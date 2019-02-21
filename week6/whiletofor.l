dig [0-9]
let [a-zA-Z]
id {let}({let}|{dig})*
op [+\-]
assig [=]
key "while"

%{

char cond[50];
int j=0;
%}

%%

"while".*$ {

	int i=5;
	for(i; i<yyleng; i++){
	if(yytext[i]!="(" && yytext[i]!=")") 
	printf("\n hi %c", yytext[i]);
	cond[j++] = yytext[i];	
	

	}
	printf("\n%s",cond);
	}


%%


void main()
{

	yylex();
	int i=0;
	for(i; i<j; i++)
	printf("hiiii%c",cond[i]);
}



