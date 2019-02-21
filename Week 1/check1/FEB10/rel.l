%{

#include<stdio.h>
#include<stdlib.h>
void yyerror(char *);
#include "y.tab.h"
%}

%%

[0-9]+ { yylval=atoi(yytext);
        return NUM;
        }
"<" return *yytext;
">" return *yytext;
"\n" return *yytext;
"<=" {
        yylval=*yytext;
        return LE;
}
">=" {
        yylval=*yytext;
        return GE;
}

"==" {
        yylval=*yytext;
        return EE;
}

"!=" {
        yylval=*yytext;
        return NE;
}
[ \t] ;
. yyerror("invalid char");

%%
int yywrap(){

return 1;
}
