digit [0-9]
letter [a-zA-Z]
letters {letter}+
operator [+*\-]
assign [=]
%{
int idcount=0,inccount=0,deccount=0,opcount=0,assignment=0;
%}
%%
"++" {inccount++;printf("increment:%s\n",yytext);}
"--" {deccount++;printf("decrement:%s\n",yytext);}

{letter}({letter}|{digit})* {idcount++;printf("identifer:%s\n",yytext);}
{assign} {assignment++;printf("assignop:%s\n",yytext);}
"+"|"-" {opcount++;printf("operator:%s\n",yytext);}

%%
int main()
{
yyin=fopen("ip1.txt","r");
yylex();
printf("idcount=%d\ninc_count=%d\ndec_count=%d\nopcount=%d\nassignment=%d",idcount,inccount,deccount,opcount,assignment);
return 0;
}
