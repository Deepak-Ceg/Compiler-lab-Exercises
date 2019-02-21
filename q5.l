%%
"/* "[a-zA-Z0-9]+" */" {printf("\nMATCHED:%s\n",yytext);}
"/* ".*" */" {printf("\nMATCHED:%s\n",yytext);
}
%%
int main()
{
yyin=fopen("input44.txt","r");
yylex();

}

