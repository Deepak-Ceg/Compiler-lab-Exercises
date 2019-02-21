digit [0-9]
letter [a-z]
special [,(){};\\=]

%{

int idcount =0;
int numcount =0;
int spacecount=0;
int assignment=0;
int operator=0;
int literal = 0;
int special =0;
char* keys[6] = {"int","float","char","void","printf","if"};
%}
%%

{digit}+ {numcount++;}
{letter}{letter}+ {
int j=0;
for(j;j<6;j++)
{
if(strcmp(keys[j],yytext)==0)
{
printf("\n%c",yytext[0]-32);int i;for(i=1;i<yyleng;i++){printf("%c",yytext[i]);}
break;
}

}
if(j==6)
{
idcount++;
}

}
[ \t\n] {spacecount++;} 
[:][ ]*[=] {assignment++;}
[+\-*/] {operator++;}
[a-zA-Z]([a-zA-Z]|[0-9])* {idcount++;}
["].*["] {literal++;}
{special}+ {special++;}
%%  
#include<string.h>
int main()
{
"count.l" 57L, 983C                                                                                                                                    1,1           Top











if(strcmp(keys[j],yytext)==0)
{
printf("\n%c",yytext[0]-32);int i;for(i=1;i<yyleng;i++){printf("%c",yytext[i]);}
break;
}

}
if(j==6)
{
idcount++;
}

}
[ \t\n] {spacecount++;} 
[:][ ]*[=] {assignment++;}
[+\-*/] {operator++;}
[a-zA-Z]([a-zA-Z]|[0-9])* {idcount++;}
["].*["] {literal++;}
{special}+ {special++;}
%%  
#include<string.h>
int main()
{

yylex();
printf("\n number count is %d",numcount);
printf("\n spacecount is %d",spacecount);
printf("\n assignment count is %d",assignment);
printf("\n operator count is %d",operator);
printf("\n identifier count is %d",idcount);
printf("\n literal count is %d",literal);
printf("\n special char count is %d",special);

return 0;
}
                                                                                                                                                       57,1          Bot

