digit [0-9]
letter [A-Za-z]
%{
	int count=0;
%}

%%

{letter}({letter}{digit})* count++;
{digit}* ;
%%

int main(void)
{

	yyin = fopen("Sample3.txt","r");
	yylex();
	printf("Number of Identifiers = %d\n",count);
	fclose(yyin);	
	return 0;

}
