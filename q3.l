%{
int lwr_count=0,upr_count=0;
%}
%%
[a-z]+ {lwr_count++;printf("lwr_count=%d\tupr_count=%d\n",lwr_count,upr_count);printf("%s\n",yytext);yymore();}
[ ] {yymore();}
[A-Z]+ {upr_count++;printf("lwr_count=%d\tupr_count=%d\n",lwr_count,upr_count);printf("%s\n",yytext);yymore();}
%%
int main()
{
yyin=fopen("in3.txt","r");
yylex();

}

