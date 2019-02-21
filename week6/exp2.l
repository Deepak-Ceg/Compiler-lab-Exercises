%{

char exp1[50];
int j=0;
int flag=0;
%}

%%

"switch".* {
		int i=7; 
  		for(i; i<yyleng-1; i++){
			exp1[j++] = yytext[i];					
	
		}

		}

"{" ;
"case"  {
		if(flag ==0)
	 	{ printf("if");
		  flag=1;
		}
		else
		{
		printf("else if ");
		flag++;
		}
		printf("%s ==",exp1);
	}
":" {printf(")");}
"break;" ;
"default:" { 
		printf("else");
	}

"}" ;
%%

void main()
{

	yylex();
}


