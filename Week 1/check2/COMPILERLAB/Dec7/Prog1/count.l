%{
   int digitcount=0,uppercase=0,lowercase=0;
%}

%%

[0-9] digitcount++;

[a-z] lowercase++;

[A-Z] uppercase++;

\n ;
. ;

%%

int main()
{
yylex();

printf("No of digits:%d\nNo of Uppercase letters : %d\nNumber of lowercase letters :%d\n",digitcount,uppercase,lowercase);
return 0;
}
