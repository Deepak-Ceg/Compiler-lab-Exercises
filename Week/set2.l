keyword "if"|"else"|"for"|"while"|"int"|"float"|"real"
reop "<"|"<="|">="|">"|"<>"|"="
upper [A-Z]
lower [a-z] 
spl [!|@|#|$|%|^|&|*|(|)]
pun [,|:|{|}]

%{

int key=0;
%}


%%

{keyword} {key++;}

%%

void main()
{
	printf("No. of keywords: %d\n",key);
	yylex();
}


