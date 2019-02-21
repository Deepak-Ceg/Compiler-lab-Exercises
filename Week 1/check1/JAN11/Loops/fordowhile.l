dig [0-9]
alpha [a-zA-Z]

%{

#include "bits/stdc++.h"
using namespace std;
string s="";

%}
%%


{alpha}+"="{dig}+ {printf("%s;\ndo\n{\n",yytext);}

({alpha}+"++"{alpha}*) {printf("%s;\n",yytext);}

({alpha}+"--"{alpha}*) {printf("%s;\n",yytext);}

([a-zA-Z0-9]+[<=|>=|!=|>|<][a-zA-Z0-9]+) {s=s+"}while("+yytext+");";}

\n {cout<<s<<endl;
s="";}

. ;

%%

int main()
{
yylex();
return 0;
}
