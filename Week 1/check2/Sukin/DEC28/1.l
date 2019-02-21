%{
int id=0,assign=0,op=0,deli=0,num=0,key=0;
%}

%%

"//"([a-zA-Z0-9]*[\n]) ;

"/*"[a-zA-Z0-9\n" "\t]*"*/" ;

int|float|char|catch|const|if|goto|for|while|do|switch|return|printf {key++;}

[a-zA-z_][a-zA-Z]* {id++;}

[0-9] {num++;}

"=" {assign++;}

([\t]|[" "]|[\n]) {deli++;}

([+]|[-]|[/]|[*]) {op++;}

. ;

%%

int main(int argc,char *argv[])
{
int i;
for(i=1;i<argc;i++)
{
id=assign=op=deli=num=key=0;
printf("The file opened is %s\n",argv[i]);
FILE *fp=fopen(argv[i],"r");
yyin=fp;
yylex();
printf("Identifiers: %d\nNumbers: %d\nAssignment Operators: %d\nDelimeter: %d\nOperators: %d\nKeywords: %d\n",id,num,assign,deli,op,key);
}
return 0;
}                
