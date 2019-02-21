dig [0-9]
alpha [a-zA-Z]

%{

#include "bits/stdc++.h"
using namespace std;
string s="";

%}
%%


{alpha}+"="{dig}+ {printf("for(%s;",yytext);}

({alpha}+"++"{alpha}*) {s=s+yytext+";)";}

({alpha}+"--"{alpha}*) {s=s+yytext+";)";}

([a-zA-Z0-9]+[<=|>=|!=|>|<][a-zA-Z0-9]+) {printf("%s;",yytext);}

\n {cout<<s<<endl;};

. ;

%%

int main()
{
yylex();
return 0;
}
