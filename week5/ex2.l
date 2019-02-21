keyword "if"|"then"|"else"|"for"|"while"|"int"|"float"|"real"|"print"|"def"|"return"
relop "<"|"<="|">"|">="|"<>"|"="
splchar [!|@|#|$|%|^|&|*|(|)]
punc [\'|\"|;|{|}|:]
lower [a-z]
upper [A-Z]
digit [0-9]
id {lower}({lower}|{digit})*
%{
int nchar=0, nword=0, nline=0, nkeyword=0,nid=0, nrelop=0, nsplchar=0, nupper=0, nlower=0,ndigit=0;
%}
%%
\n {nline++; nchar++;}
{keyword} {nkeyword++; nlower+= yyleng; nword++; nchar+=yyleng;}
{relop} {nrelop++; nchar+=yyleng;}
{splchar} {nsplchar++; nchar+=yyleng;}
{punc} {nchar++;}
{upper}+ {nupper+=yyleng; nchar+=yyleng;}
{lower}+ {nlower+=yyleng; nchar+=yyleng;}
{digit}+ {nword++; ndigit++; nchar+=yyleng;}
[\t ' '] {nword++; nchar+=yyleng;}
%%
int main(void)
{
yylex();
printf("No. of characters: %d\n",nchar);
printf("No. of words: %d\n",nword);
printf("No. of lines: %d\n",nline);
printf("No. of keywords: %d\n",nkeyword);
printf("No. of relational operators: %d\n",nrelop);
printf("No. of special characters: %d\n",nsplchar);
printf("No. of lowercase: %d\n",nlower);
printf("No. of uppercase: %d\n",nupper);

printf("No. of digits: %d\n",ndigit);
return 0;
}
