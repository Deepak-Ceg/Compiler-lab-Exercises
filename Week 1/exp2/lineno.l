%{
  int nchar=0,nline=0,nword=0;

%}

%%

\n {nline++; nchar++;}
[^ \t\n]+ {nword++, nchar+=yyleng;}
. {nchar++;}


%%

int main(int argc, char *argv[])
{
	yyin = fopen(argv[1] ,"r");
	yylex();
	printf("%d %d %d",nchar,nline,nword);

	fclose(yyin);
	return 0;

}

