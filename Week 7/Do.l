%{
#include<string.h>
char expr[500];
int len=0,flag=0,j=0,i=0;
%}

%%
";" {}
"do {" {
	if(flag==0){
		printf("%s",yytext);
		flag=1;	
	}
	
}

"{"|"}" { }

"while ("(.)*")" { 
i=0;
while(i++ < 7 && yytext++ );
while( *yytext != ')' ){
expr[j]=*yytext;
j++;
yytext++;
}


expr[j++]=' ';
expr[j++]='&';
expr[j++]='&';
expr[j++]=' ';
len++;
//printf("%s",expr);
} 

%%

int main(){
yylex();
printf("} while (");
int ind=0,ands=0;
for(ind=0;ind<500;ind++ ){
	if(expr[ind] == '&'){
		ands++;	
	}
	if(ands==len){
		break;
	}
	if(expr[ind]=='&'){
		ind=ind+1;
		printf("&&");
		continue;	
	}
	printf("%c",expr[ind]);

	

}

printf("); \n");
}


