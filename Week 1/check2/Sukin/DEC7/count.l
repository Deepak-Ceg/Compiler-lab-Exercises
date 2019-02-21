%{
 int charcount=0,linecount=0,wordcount=0;
%}

%%
. charcount++;
\n {linecount++;}
[^ \t\n]+ {wordcount++; charcount+=yyleng;}
%%

int main()
{
yylex();
printf("\nThere were %d characters in %d lines with %d words\n",charcount,linecount,wordcount);
return 0;
}

