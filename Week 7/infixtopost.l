letter [a-z]
op [-+*/]
%{
	char a[50];
	int i=0,j=0,k=0;
	int check(char t)
	{
		if(t=='+' || t=='-')
			return 1;
		if(t=='*' || t=='/')
			return 2;
		
	}
%}
%%

{op} {
		j=i-1;
		if(i>0 && check(*yytext) > check(a[j]))
		{
			a[i++] = yytext[0];
		}
		else if(i==0)
		{
			a[i++] = yytext[0];
		}
		else
		{
			while(j>=0 && check(a[j]) > check(*yytext))
			{
				printf("%c", a[j--]);
			}
			i=j+1;
			a[i++] = yytext[0];
		}
	}

{letter} {
	if(*yytext == 'z')
	{
		while(i>=0)
		{
			printf("%c", a[--i]);
		}
	}
	else
		printf("%s", yytext);
	}

%%

void main()
{
	
	yylex();
}
