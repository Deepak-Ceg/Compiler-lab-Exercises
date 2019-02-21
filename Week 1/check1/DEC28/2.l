%{
int rel=0,upper=0,lower=0,special=0,consts=0,strings=0;
%}

%%

"//"(.*[\n]) ;

"/*"[a-zA-Z0-9\n]*"*/" ;

([<=]|[<]|[>=]|[>]|[<>]|[=]) {rel++;}

[A-Z] {upper++;}

[a-z] {lower++;}

([!]|[@]|[#]|[$]|[%]|["^"]|[&]|[*]|[(]|[)]) {special++;}

[0-9]* {consts++;}

(["][a-zA-Z0-9" "]*["]) {strings++;}

.|\n ;

%%

int main(int argc,char *argv[])
{
int i=0;
for(i=1;i<argc;i++)
{
rel=upper=lower=special=consts=strings=0;
printf("The file opened is %s\n",argv[i]);
FILE *fp=fopen(argv[i],"r");
yyin=fp;
yylex();
printf("Relational Operators: %d\nUppercase: %d\nLowercase: %d\nSpecial Characters: %d\nConstants: %d\nStrings: %d\n",rel,upper,lower,special,consts,strings);
}
int yywrap(void);
return 0;
}                 
