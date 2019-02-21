ch [a-z]
digit [0-9]
id {ch}({digit}|{ch})* 
%{
#include<string.h>
char expr[100][100];
char val[100][100];
int flag=0,len=0,i=0,j=0;
%}


%%
"#define "(.)*" "(.)* {
//printf("%s",yytext);
j=0;
while(j++ < 8 && yytext++ );


i=0;
while(*yytext!=')'){
expr[len][i]=*yytext;
i++;
yytext++;
}
expr[len][i++]=')';
expr[len][i++]='\0';

yytext++;
i=0;
while(*yytext!='\0'){
val[len][i]=*yytext;
yytext++;
i++;
}
val[len][i]=='\0';

printf("int %s{\nreturn %s;\n}",expr[len],val[len] );
len++;
}





%%

