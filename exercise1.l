operator "++"|"--"
letter [a-zA-Z]
%{
int i=0;
char a[1000];
char b[1000];
%}
%%
"for"   {}
"("[^;]*        { for(i=1;i<yyleng;i++)
                {

                 printf("%c",yytext[i]);
                }
                        printf(";\ndo\n{\n");
                }
";"[^;]*";"     {
                        for(i=1;i<yyleng-1;i++)
                                {
                                a[i-1]=yytext[i];
                                }
}
{letter}+{operator}")"  {
                         for(i=0;i<yyleng-1;i++)
                             {
                             b[i]=yytext[i];
                             }
                                }

"{"(.*\n)+"}"     {             for(i=1;i<yyleng-1;i++)
                {
                        printf("%c",yytext[i]);
                }
                          printf("%s ;}",b);
                          printf("while(%s);",a);
                }

%%
int main()
{
yyin=fopen("exer1.txt","r");
yylex();
fclose(yyin);
}              
