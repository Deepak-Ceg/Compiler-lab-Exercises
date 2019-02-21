key if|else
flower1 "{"
flower2 "}"

%{

#include "bits/stdc++.h"
using namespace std;
int flag1=0,flag=0;
%}
%%

{key} {}

(\n) ;

{flower1} {if(flag1==0)
	printf("?");
	flag1=1;
}


{flower2} {if(flag==0)
	printf(":");
	flag=1;}

. {printf("%s",yytext);}


%%

int main()
{
yylex();
return 0;
}
