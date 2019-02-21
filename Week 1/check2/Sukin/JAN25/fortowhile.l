dig [0-9]
alpha [a-zA-Z]

%{
#include "bits/stdc++.h"
using namespace std;
int iniflag1=0,cflag1=0,of=0,cf=0,sflag1=0;
string ini1="",ini2="",c1="",c2="",s1="",s2="";
%}

%%

{alpha}+"="{dig}+ {
if(iniflag1==0)
ini1=ini1+yytext;
else
ini2=ini2+yytext;
iniflag1++;
}


([a-zA-Z0-9]+[<=|>=|!=|>|<][a-zA-Z0-9]+) {
if(cflag1==0)
c1=c1+yytext;
else
c2=c2+yytext;
cflag1++;
}

({alpha}+"++"{alpha}*) {
if(sflag1==0)
s1=s1+yytext;
else
s2=s2+yytext;
sflag1++;
}


\n {
cout<<ini1<<endl;
cout<<"while("<<c1<<"){"<<endl;
cout<<ini2<<endl;
cout<<"while("<<c2<<"){"<<endl;
cout<<s1<<endl;
cout<<"}"<<endl;
cout<<s2<<endl;
cout<<"}"<<endl;
}

. ;

%%

int main()
{
yylex();
return 0;
}
