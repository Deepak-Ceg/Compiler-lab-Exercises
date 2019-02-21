%{
int i=0;
int psp,pep,rsp,rep;
char* param;
char* ret;
int paramlen=0;
int retlen=0;
%}
%%
"#define "[a-z]*" "[0-9 ]* {
i=8;
psp=i;
param=yytext[i];
while(yytext[i]!=' ')
{
printf("%c",yytext[i]);
i++;
paramlen++;
}
pep=i-1;
printf("\n");
i++;
rsp=i;
ret=yytext[i];
while(i<yyleng)
{
printf("%c", yytext[i]);
i++;
retlen++;
}
rep=i-1;
printf("Match over\n Param len=%d Re len=%d",paramlen,retlen);
printf("\n%d %d %d %d\n",psp,pep,rsp,rep);
int j;
printf("func(");
for(j=psp;j<=pep;j++)
printf("%c",yytext[j]);
printf(")\n{\nreturn");
for(j=rsp;j<=rep;j++)
printf("%c",yytext[j]);
printf("\n}");
}
%%
int main()
{
yyin=fopen("mac.txt","r");
yylex();
}
