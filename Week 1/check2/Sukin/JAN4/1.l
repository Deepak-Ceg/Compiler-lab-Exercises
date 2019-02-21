%{
#include <bits/stdc++.h>
using namespace std;

vector<string>key,sp,var,assign,unary,binary;

%}

%%

" "print|" "return|" "def {key.push_back(yytext);}

" "([(]|[)]|[:]) {sp.push_back(yytext);}

" "([a-zA-Z_][a-zA-Z_0-9]*) {var.push_back(yytext);}

" "= {assign.push_back(yytext);} 

" "("++"|"--") {unary.push_back(yytext);}

" "([+]|[-]|[*]|[/]) {binary.push_back(yytext);}

\n ;

. ;

%%

int main(int argc,char *argv[])
{
int i;
for(i=1;i<argc;i++)
{
FILE *fp=fopen(argv[i],"r");
yyin=fp;
yylex();
}
cout<<"Keywords"<<endl;
for(i=0;i<key.size();i++)
{
cout<<key[i]<<endl;
}
cout<<"Special Characters"<<endl;
for(i=0;i<sp.size();i++)
{
cout<<sp[i]<<endl;
}
cout<<"Variables"<<endl;
for(i=0;i<var.size();i++)
{
cout<<var[i]<<endl;
}
cout<<"Assignment Operators"<<endl;
for(i=0;i<assign.size();i++)
{
cout<<assign[i]<<endl;
}
cout<<"Unary Operators"<<endl;
for(i=0;i<unary.size();i++)
{
cout<<unary[i]<<endl;
}
cout<<"Binary Operators"<<endl;
for(i=0;i<binary.size();i++)
{
cout<<binary[i]<<endl;
}
return 0;
}
