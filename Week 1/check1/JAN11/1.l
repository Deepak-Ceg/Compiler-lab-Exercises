%{
#include "bits/stdc++.h"
stack <char> st;
int tos=0;
void push(char);
void pop();
char top();
char op;
char temp;
int priority(char c);
%}

%%

[a-zA-Z]? {printf("%c",yytext[0]);}

([+]|[-]|[*]|[/]|[(]|[)]) {

char op=yytext[0];
if(st.empty()||op=='(')
st.push(op);
else if(op==')')
  	{
		while(st.top!='(')
		{
			temp=st.top();
			printf("%c",temp);	
			st.pop();
		}
		st.pop();
	}

else if(priority(op)>=priority(st.top()))
st.push(op);

else if(priority(op)<priority(st.top()))
	{
		while(priority(op)<priority(st.top()))
			{
				temp=st.top();	
				printf("%c",temp);			
				st.pop();
			}
		st.push(op);
	}

}

%%

int main()
{
yylex();
return 0;
}

int priority(char c)
{
if(c=='(' || c==')')
return 0;
if(c=='+' || c=='-')
return 1;
if(c=='*' || c=='/')
return 2;
}
