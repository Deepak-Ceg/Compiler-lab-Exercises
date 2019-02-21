%{
 int dcount=0,ucount=0,lcount=0;
%}

%%
[0-9] dcount++;
[a-z] lcount++;
[A-Z] ucount++;
%%

int main()
{
yylex();
printf("Digits: %d\nLowercase: %d\nUppercase: %d\n",dcount,lcount,ucount);
return 0;
}

