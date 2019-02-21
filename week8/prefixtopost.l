expr [a-zA-Z0-9*+/-]
%{
char match[100];
#include<string.h>
%}
%%
{expr}* {strcpy(match, yytext); printf("%s\n",match);
char stack[10], op;
int i,len=strlen(match),j=0,top=-1;
for(i=0;i<len;i++) {
	switch(match[i]) {
		case '+':
top++;
stack[top]=match[i];
break;
case '-':
top++;
stack[top]=match[i];
break;
case '*':
top++;
stack[top]=match[i];
break;
case '/':
top++;
stack[top]=match[i];
break;
default:
printf("%c",match[i]);
printf("%c",stack[top]);
top--;
}
}
}
%%
int main()
{
yylex();
return 0;
}
