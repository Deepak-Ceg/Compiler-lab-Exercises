consonant [bcdfghjklmnpqrstvwxyz]
%%
{consonant}*a{consonant}*e{consonant}*i{consonant}*o{consonant}*u{consonant}* {printf("Matched string: %s",yytext);}
%%
int main()
{
yylex();
return 0;
}
