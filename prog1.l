%{
int flag=0;
        char initial1[100],cond[100],incre[100];
        int initial=0,con=0,in=0,r=0,c=0;
        char rest[500][500];
%}

%%

"{" ;

^[a-zA-Z][a-zA-Z0-9]*" = "[0-9]+";"$ {
        if(flag == 0){
                int i;
                for(i=0;yytext[i]!='\0';i++){
                        initial1[initial++] = yytext[i];
                }
                initial1[initial]='\0';
                flag++;
        }
}
"while ("[a-zA-Z][a-zA-Z0-9]*" "("<"|">"|"<="|">="|"=="|"!=")" "[0-9]+") {" {
        int i;
        for(i=7;yytext[i]!=')';i++){
                cond[con++] = yytext[i];
        }
        cond[con] = '\0';
        flag++;
}

[a-zA-Z][a-zA-Z0-9]*" = "[a-zA-Z][a-zA-Z0-9]*" "("+"|"-")" "[0-9]+";" {
        int i;
        for(i=0;yytext[i]!=';';i++){
                incre[in++] = yytext[i];
        }
        incre[in] = '\0';
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
        printf("\nfor (");
	printf("%s", initial1);
	printf("%s", cond);
        printf(";");
	printf("%s", incre);
        printf(") {\n");
        int i,j;
        for(i=0;i<r;i++){
                for(j=0;rest[i][j]!='\0';j++)
                        printf("%c",rest[i][j]);
                printf("\n");
        }
        printf("}\n");
        return 0;
}
                                                                                  
