%{
int count[10] = {0,0,0,0,0,0,0,0,0,0};
int flag = 0 ;
%}
%%
[0-9]* {
int i=0;
for(i=0;i<yyleng;i++)
{
switch(yytext[i])
{
case '0': count[0]++; break;
case '1': count[1]++; break;
case '2': count[2]++;break;
case '3': count[3]++;break;
case '4': count[4]++;break;
case '5': count[5]++;break;
case '6': count[6]++;break;
case '7': count[7]++;break;
case '8': count[8]++;break;
case '9': count[9]++;break;
}
}
for(i=0;i<10;i++)
{
printf("%d",count[i]);
if(flag>1)
flag=-1;
if(count[i]>1)
flag=-1;
if(count[i]!=0)
flag++;
}
if(flag==0 || flag==1)
printf("Matched string: %s", yytext);
}
%%
int main()
{
yylex();
return 0;
}
