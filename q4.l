lwr [a-z]
upr [A-Z]

%{
int count=0,no=0;
%}
%%
{upr}+ {count++;printf("%s\n",yytext);}
{upr}*{lwr}+{upr}* {no++;printf("%s\n",yytext);}

%%
int main()
{
yyin=fopen("in4.txt","r");
yylex();
printf("crct_count=%d\nwrong_count=%d\n",count,no);
return 0;
}


