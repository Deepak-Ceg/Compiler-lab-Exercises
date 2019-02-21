letter [a-zA-Z]
letters {letter}+
digit [0-9]
spl [():!]
operator [+\-*]
keyword "printf"|"def"|"return"|"for"|"while"
%{
int keycount=0,splcount=0,digit=0,idcount=0,opcount=0;
%}
%%
{letter} {idcount++;printf("identifier=%s\n",yytext);}

{keyword} {keycount++;printf("keyword=%s\n",yytext);}

{spl} {splcount++;printf("splchar=%s\n",yytext);}
{digit} {digit++;printf("digit=%s\n",yytext);}
{operator} {opcount++;printf("operator=%s\n",yytext);}
%%
int main()
{
yyin=fopen("ip2.txt","r");
yylex();
printf("keyword_count=%d\nidentifier_count=%d\nsplchar_count=%d\ndigit_count%d\nop_count%d\n",keycount,idcount,splcount,digit,opcount);
}
