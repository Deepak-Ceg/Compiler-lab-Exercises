%{

#include "bits/stdc++.h"
using namespace std;

string str="";

%}

%%

[ab]*(abb)[ab]* ;

. {
	str+=yytext;
}
\n {
	cout<<str<<endl;
	str="";
};

%%
 
int main()
{
yylex();
return 0;
}

