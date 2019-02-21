%{
int countA=0, countB=0;
%}
%%
[ab]+ {
countA=0; countB=0;
int i; for(i=0;i<yyleng;i++)
{
if(yytext[i]=='a')
countA++;
else if(yytext[i]=='b')
countB++;
}
printf("%d %d", countA, countB);
if((countA%2==0)&&(countB%2!=0))
printf("Matched string: %s", yytext);
}
%%
int main()
{
yylex();
return 0;
}
