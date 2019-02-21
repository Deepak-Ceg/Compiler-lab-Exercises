%{
	int count[10];
	int flag = 0;
%}

%%
"0" count[0]++;
"1" count[1]++;
"2" count[2]++;
"3" count[3]++;
"4" count[4]++;
"5" count[5]++;
"6" count[6]++;
"7" count[7]++;
"8" count[8]++;
"9" count[9]++;

\n { int i; for(i=0; i<9; i++)
	{
		if(count[i] > 1)
		{
			flag =1;
		}
	}
	if(flag ==1)
		printf("\nInvalid");
	else
		printf("\nValid");
  }	

. ;

%%


void main()
{

	yylex();
	printf("Helloooo");
	

}


