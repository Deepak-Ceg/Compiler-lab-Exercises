%%

[aAbB]+ {int i,ch=0; for(i=0;i<=yyleng-3;i++){


if((yytext[i]=='a'||yytext[i]=='A') && (yytext[i+1] == 'b'||yytext[i+1]=='B') && (yytext[i+2] == 'b'||yytext[i+2]=='B'))
{
ch =1;
break;
}
}
if(yyleng<3)
ch =1;
if(ch == 0)
{
printf("\n%s",yytext);
}
}
[bB][a-zA-Z]*[sS] {if(yytext[yyleng-1]=='s'||yytext[yyleng-1]=='S')printf("%s",yytext);}
[0-9]+ {int ch =0,i;
int count[10];
for(i=0;i<10;i++)
count[i] =0;
for(i=0;i<yyleng;i++)
{
int in = yytext[i] - 0;
if(count[in]==0)
count[in] = 1;
else
break;
}
if(i==yyleng)
printf("%s",yytext);
}
[^ \t\n] {}
%%

int main()
{

yylex();

return 0;
}
~                                                                                                                                                                        
"ex2.l" 44L, 594C                                                                                                                                      1,1           All

