%{
int flag=0;
        char initial1[100],cond[100],incre[100];
        int ini=0,con=0,in=0,r=0,c=0;
        char rest[500][500];
%}

%%

"{" ;

"for ( "[a-zA-Z][a-zA-Z0-9]*;" "[a-zA-Z][a-zA-Z0-9]*;" "[a-zA-Z][a-zA-Z0-9]*;" ) {" {
        int i;
        for(i=6;yytext[i]!=';';i++){
                initial1[ini++] = yytext[i];
        }
        initial1[ini] = '\0';

	i = i+2;
        for(;yytext[i]!=';';i++){
                cond[con++] = yytext[i];
        }
        cond[con] = '\0';

	i = i+2;
        for(;yytext[i]!=';';i++){
                incre[in++] = yytext[i];
        }
        incre[in] = '\0';


        flag++;
}

^[a-zA-Z]+[ \t]*[a-zA-Z0-9]+.$ {
 int i;
                for(i=0;yytext[i]!='\0';i++)
                        rest[r][c++] = yytext[i];
                rest[r][c] = '\0';
                c = 0;
}
\n {r++;}

%%

int main(){
        yylex();

	printf("%s", initial1);

        printf("}\n");
        return 0;
}
                                                                                  
