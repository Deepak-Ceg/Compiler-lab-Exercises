%{
#include<bits/stdc++.h>
#include "lex.yy.c"
using namespace std;
int yylex();
void yyerror(char*);
vector<string> st(100);
int top=0;
char i[2]="0";
char temp[2]="t";
map<string,int> mp1;
map<string,string> mp2;
void push(string);
void codegen_assign();
void codegen();
void codegen_umin();

%}
%token ID NUM
%right '='
%left '+' '-'
%left '*' '/'
%left UMINUS

%%

S : ID{push(yytext);} '='{push(yytext);} E{codegen_assign();}
   ;
E : E '+'{push(yytext);} T{codegen();}
   | E '-'{push(yytext);} T{codegen();}
   | T
   ;
T : T '*'{push(yytext);} F{codegen();}
   | T '/'{push(yytext);} F{codegen();}
   | F
   ;
F : '(' E ')'
   | '-'{push(yytext);} F{codegen_umin();} %prec UMINUS
   | ID{push(yytext);}
   | NUM{push(yytext);}
   ;
%%

int main()
 {
 printf("Enter the expression : ");
 yyparse();
return 0;
 }

void push(string s)
{
++top;
	st[top]=s;
//cout<<st[top]<<endl;
}

void codegen()
 {
 string temp="t";
temp+=i;
string t1=st[top-2];
t1+=st[top-1];
t1+=st[top];
if(mp1[t1]==0)
{
  cout<<temp<<"="<<st[top-2]<<" "<<st[top-1]<<" "<<st[top]<<endl;
 top-=2;
mp1[t1]=1;
mp2[t1]=temp;
st[top]=temp;
}
else
{
 //cout<<mp2[t1]<<"="<<t1<<endl;
top-=2;
 st[top]=mp2[t1];
}
 i[0]++;
 }

void codegen_umin()
 {
 string temp="t";
temp+=i;
string t1="-";
t1+=st[top];
if(mp1[t1]==0)
{
// printf("%s = -%s\n",temp,st[top])
cout<<temp<<"="<<" "<<"-"<<st[top]<<endl;
 top--;
mp1[t1]=1;
mp2[t1]=temp;
st[top]=temp;
}
else
{
//cout<<mp2[t1]<<"="<<t1<<endl;
top--;
string s1=mp2[t1];
 st[top]=s1;
}
 i[0]++;
 }

void codegen_assign()
 {
string t1=st[top];
if(mp1[t1]==0)
{
// printf("%s = %s\n",st[top-2],st[top]);
cout<<st[top-2]<<" = "<<st[top]<<endl;
mp1[t1]=1;
mp2[t1]=st[top-2];
top-=2;
}
else
{
//cout<<mp2[t1]<<"="<<t1<<endl;
top-=2;
}
 }
void yyerror(char*s)
{
fprintf(stderr,"%s\n",s);
}

