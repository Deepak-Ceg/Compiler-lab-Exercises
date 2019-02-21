%{
int id=0,assign=0,op=0,deli=0,num=0,key=0;
%}

%%

int|float|char|catch|const|if|goto|for|while|do|switch|return|printf {key++;}

[a-zA-z_][a-zA-Z]* {id++;}

[0-9] {num++;}

"=" {assign++;}

([\t]|[\n]|[" "]) {deli++;}

([+]|[-]|[/]|[*]) {op++;}

. ;

%%

int main()
{
yylex();
printf("Identifiers: %d\nNumbers: %d\nAssignment Operators: %d\nDelimeter: %d\nOperators: %d\nKeywords: %d\n",id,num,assign,deli,op,key);
return 0;
}
