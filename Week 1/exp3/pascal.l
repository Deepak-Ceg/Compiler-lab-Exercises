digit [ 0-9]
letter [A-Za-z]

%{
	int count1=0;
	int count=0;
%}

%%
{letter}({letter}|{digit})* {count++;}
{digit}({letter}|{digit})* ;
%%

int main(void)
{
	yyin = fopen("Sample3.txt","r");
	yylex();
	printf("Number of Identifiers = %d\n",count);
	
	fclose(yyin);	
	return 0;
}
