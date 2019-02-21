
%%

"#define" ;
[a-zA-Z]+[(][a-zA-Z]+[)] {printf("int %s\n",yytext);}
[a-zA-Z]+[-+*/][a-zA-Z]+ {printf("{\nreturn %s;\n}\n",yytext);}
%%
int main()
{
yylex();
return 0;
}

