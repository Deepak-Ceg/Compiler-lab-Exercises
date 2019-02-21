%{
#include<stdio.h>
int e,i,ifflag1=0,count=0;
%}
%%

("if(")[a-zA-Z]([<]|[>])[0-9](")") {

if(ifflag1==0)
{
printf("%s\n{\n}\n",yytext);
ifflag1=1;
}

else{
printf("elseif(");
for(i=3;i<yyleng-1;i++) printf("%c",yytext[i]);
printf(")\n{\n}\n");
e=0;
}
}
else {
e=1;
}

\n ;

. ;

%%
int main()
{
yylex();
if(e==1)
{
printf("else\n{\n}");
}
return 0;
}
