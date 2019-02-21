%{
	#include<stdio.h>
%}
%token ID NUM
%right '='
%left '+' '-'
%left '*' '/'
%left UMINUS
%%

S       : ID{push();} '='{push();} E{codegen_assign();} ';' S
        |
	| '\n'
	;
E       : E '+'{push();} T{codegen();}
        | E '-'{push();} T{codegen();}
        | T
        ;
T       : T '*'{push();} F{codegen();}
        | T '/'{push();} F{codegen();}
        | F
        ;
F       : '(' E ')'
        | '-'{push();} F{codegen_umin();} %prec UMINUS
        | ID{push();}
        | NUM{push();}
        ;
%%


#include "lex.yy.c"
#include<ctype.h>
char st[100][10];
int top=-1;
char i_[10]="0";
char temp1[10]="R";
char temp2[10]="R";
char load[2]="\0";
void push()
{
        strcpy(st[++top],yytext);
}

void codegen()
{
        if(strcmp(i_,"3")==0)
		strcpy(i_,"0");
	strcpy(load,"LD");
        strcat(temp1,i_);
	printf("%s %s,%s\n",load,temp1,st[top-2]);
	i_[0]++;
	if(strcmp(i_,"3")==0)
		strcpy(i_,"0");
	strcat(temp2,i_);
	printf("%s %s,%s\n",load,temp2,st[top]);
	if(strcmp(st[top-1],"+")==0){
			printf("ADD %s,%s,%s\n",temp2,temp1,temp2);
	}
	else if(strcmp(st[top-1],"-")==0){
                        printf("SUB %s,%s,%s\n",temp2,temp1,temp2);
        }
	else if(strcmp(st[top-1],"*")==0){
                        printf("MUL %s,%s,%s\n",temp2,temp1,temp2);
        }
	top-=2;
        strcpy(st[top],temp2);
	strcpy(temp1,"R");
	strcpy(temp2,"R");
        i_[0]++;
}
void codegen_umin()
{
/*        strcpy(temp,"t");
        strcat(temp,i_);
        printf("%s = -%s\n",temp,st[top]);
        top--;
        strcpy(st[top],temp);
        i_[0]++;
*/
}

void codegen_assign()
{
        printf("ST %s,%s\n",st[top-2],st[top]);
        top-=2;

}
int main()
{
	yyparse();
}

