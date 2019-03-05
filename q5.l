%%
"/* ".*" */" {printf("\nMATCHED:%s\n",yytext);
}
%%
int main()
{
yyin=fopen("input44.txt","r");
yylex();

}
