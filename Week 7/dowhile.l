%{
char init[9999],cond[9999],stmt[9999];
int in,c,s;
%}
%%
(.*[\n])+"do\n{" { int i=0;while(i<yyleng-5){init[in++]=yytext[i++];}

"do\n{" {}

"}"(while).+ { int i;
i=0;
while(yytext[i++]!='(');
for(;yytext[i]!=')';i++)cond[c++]=yytext[i];
cond[c++]='#';
}

.*{int i=0;for(;i<yyleng;i++)stmt[s++]=yytext[i];}

%%

int main(){
yylex();
printf("%s",init);
printf("\n%s\n}while(",stmt);
int i=0;
char con[9999];int j=0;
while(cond[i]!=NULL){
if(cond[i]=='#'){con[j++]='&';con[j++]='&';i++;}
else con[j++]=cond[i++];
}
con[j-2]='\0';
printf("%s",con);
printf(");"); 
return 0;
}

