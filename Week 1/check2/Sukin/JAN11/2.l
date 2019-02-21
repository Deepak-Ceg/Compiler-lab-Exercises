%{
char st[100];
int tos=-1;
void push(char c);
void pop();
char top();
char op;
char temp;
int priority(char c);
%}

%%

[a-zA-Z0-9]? {printf("%c",yytext[0]);}

([+]|[-]|[*]|[/]|[(]|[)]) {

char op=yytext[0];
if(tos==-1||op=='(')
push(op);
else if(op==')')
  	{
		while(top()!='(')
		{
			temp=top();
			printf("%c",temp);	
			pop();
		}
		pop();
	}

else if(priority(op)>=priority(top()))
push(op);

else if(priority(op)<priority(top()))
	{
		while(priority(op)<priority(top()))
			{
				temp=top();	
				printf("%c",temp);			
				pop();
			}
		push(op);
	}

}

\n {

int i;
for(i=tos;i>-1;i--)
{
if(st[i]!='(' && st[i]!=')')
printf("%c",st[i]);
}
tos=-1;
printf("\n");
}

%%

int main()
{
yylex();
return 0;
int yywrap(void);
}

int priority(char c)
{
if(c=='(')
return 0;
if(c=='+' || c=='-')
return 1;
if(c=='*' || c=='/')
return 2;
}
void push(char c)
{
st[++tos]=c;
}
void pop()
{
tos--;
}
char top()
{
return st[tos];
}
