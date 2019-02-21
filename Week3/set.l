data "int"|"float"
%{
	int numbercount=0;
	int whitespacecount=0;
	int assigncount=0;
	int opcount=0;
	int id=0;

%}

%%


[0-9][0-9]* { numbercount+=yyleng;}
[ \t\n] {whitespacecount+=yyleng;}
:= {assigncount++;}
[+\-*/] { opcount++;}

[a-z] { printf("%c",*yytext-'a'+'A');}
{data}* [a-z][,;)] { printf("%c",*yytext-'a'+'A'); id++;}


%%


void main()
{

	yylex();
	printf("Helloooo");
	printf("\n%d ", numbercount);
	printf("\n%d", whitespacecount);
	printf("\n%d", assigncount);
	printf("\n%d", opcount);
	printf("\n%d", id);
	

}


