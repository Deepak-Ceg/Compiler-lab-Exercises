%token ID NUM
%right '='
%left '+' '-'
%left '*' '/'
%left UMINUS
%%
S:ID{push();} '='{push();} E{codegen_assign();}
;
E:E'+'{push();} T{genintermediatecode();}
|E'-'{push();} T{genintermediatecode();}
| T
;
T:T'*'{push();} F{genintermediatecode();}
|T'/'{push();} F{genintermediatecode();}
|F
;
F:'(' E ')'
|'-'{push();} F{codegen_umin();} %prec UMINUS
|ID{push();}
|NUM{push();}
;
%%
#include "lex.yy.c"
#include<ctype.h>
char st[100][10];
int top=0;
char i_[2]="0";
char temp[2]="t";
main()
{
printf("Enter the expression : ");
yyparse();
}
push()
{
strcpy(st[++top],yytext);
}
genintermediatecode()
{
strcpy(temp,"t");
strcat(temp,i_);
printf("%s = %s %s %s\n",temp,st[top-2],st[top-1],st[top]);
top-=2;
strcpy(st[top],temp);
i_[0]++;
}
codegen_umin()
{
strcpy(temp,"t");
strcat(temp,i_);
printf("%s = -%s\n",temp,st[top]);
top--;
strcpy(st[top],temp);
i_[0]++;
}
codegen_assign()
{
printf("%s = %s\n",st[top-2],st[top]);
top-=2;
}
