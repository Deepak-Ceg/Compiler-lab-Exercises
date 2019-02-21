digits [0-9]+
opfrac (\.{digits})?
opexpo ("E"[+\-]?{digits}+)?
number {digits}{opfrac}{opexpo}

%%

^{number}$ {printf("Unsigned Numbers");} 
^[+\-]{number}$ {printf("Signed Numbers");}


%%

void main()
{
yylex();

}



