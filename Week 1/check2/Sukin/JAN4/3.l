%{
#include <bits/stdc++.h>
using namespace std;

vector<string>key,sp,var,assign,unary,binary;

%}

%%

" "print|" "return|" "def {printf("%sis a keyword\n",yytext);}

" "([(]|[)]|[:]) {printf("%s is a special character\n",yytext);}

" "([a-zA-Z_][a-zA-Z_0-9]*) {printf("%s is a variable\n",yytext);}

" "= {printf("%s is an assignment operator\n",yytext);} 

" "("++"|"--") {printf("%s is an unary arithmetic operator\n",yytext);}

" "([+]|[-]|[*]|[/]) {printf("%s is a binary arithmetic operator\n",yytext);}

\n ;

. ;

%%

int main(int argc,char *argv[])
{
int i;
for(i=1;i<argc;i++)
{
printf("The file opened is %s\n",argv[i]);
FILE *fp=fopen(argv[i],"r");
yyin=fp;
yylex();
}
return 0;
}
