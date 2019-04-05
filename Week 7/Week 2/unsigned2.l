digit [0-9]
digits {digits}+
opfrac (\.{digits})?
opexpo ("E"[+\-]? {digits})?
number {digits}{opfrac}{opexp}

%%
{number} {printf("Unsigned Numbers");} 
%%

int main()
{
yylex();
return 0;

}



