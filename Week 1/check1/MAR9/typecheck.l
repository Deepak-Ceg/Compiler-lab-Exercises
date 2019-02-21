%{
#include<bits/stdc++.h>
using namespace std;
vector<string> lexeme,datatype;
vector<int> ind;
int in=0,i;
string temp,tot;
int numfound,tempnum;
int flag;
int c;
map<string,int> mp1,mp2;
%}

id [a-zA-Z_][a-zA-Z0-9_]*


%%

^"int".+ {
        tot=yytext;
        numfound=0;
        tempnum=0;
        flag=0;
        for(i=0;i<tot.size();i++)
        {
                if(tot[i]=='['||tot[i]==']'||(tot[i]>='0'&&tot[i]<='9'&&numfound==0))continue;
                if(tot[i]==';'||tot[i]==',')
                {
                        mp1[temp]=tempnum;
                        mp2[temp]=in;
                        temp.clear();
                        tempnum=0;
                        numfound=0;
                        lexeme.push_back("ID");
                        datatype.push_back("int");
                        ind.push_back(in);
                        in++;
                        continue;
                }
                if(numfound==1)
                {
                        if(tot[i]!=';'&&tot[i]!=',')
                                tempnum=tempnum*10+(tot[i]-'0');
                        else
                        {
                                numfound=0;
                        }
                        continue;
                }
                if(tot[i]==' ')
                {
                        flag=1;
                        continue;
                }
                if(flag==1&&tot[i]!=',')
                {
                        if(tot[i]=='=')
                        numfound=1;
                        else
                        temp+=tot[i];
                }
        }

}

^"float".+ {

         tot=yytext;
        numfound=0;
        tempnum=0;
        flag=0;
        for(i=0;i<tot.size();i++)
        {
                if(tot[i]=='['||tot[i]==']'||(tot[i]>='0'&&tot[i]<='9'&&numfound==0))continue;
                if(tot[i]==';'||tot[i]==',')
                {
                        mp1[temp]=tempnum;
                        mp2[temp]=in;
                        temp.clear();
                        tempnum=0;
                        numfound=0;
                        lexeme.push_back("ID");
                        datatype.push_back("float");
                        ind.push_back(in);
                        in++;
                        continue;
                }
                if(numfound==1)
                {
                        if(tot[i]!=';'&&tot[i]!=',')
                                tempnum=tempnum*10+(tot[i]-'0');
                        else                                                                                                           
			{
                                numfound=0;
                        }
                        continue;
                }
                if(tot[i]==' ')
                {
                        flag=1;
                        continue;
                }
                if(flag==1&&tot[i]!=',')
                {
                        if(tot[i]=='=')
                        numfound=1;
                        else
                        temp+=tot[i];
                }
        }
}

^"char".+ {

        tot=yytext;
        numfound=0;
        tempnum=0;
        flag=0;
        for(i=0;i<tot.size();i++)
        {
                if(tot[i]=='['||tot[i]==']'||(tot[i]>='0'&&tot[i]<='9'&&numfound==0))continue;
                if(tot[i]==';'||tot[i]==',')
                {
                        mp1[temp]=tempnum;
                        mp2[temp]=in;
                        temp.clear();
                        tempnum=0;
                        numfound=0;
                        lexeme.push_back("ID");
                        datatype.push_back("char");
                        ind.push_back(in);
                        in++;
                        continue;
                }
                if(numfound==1)
                {
                        if(tot[i]!=';'&&tot[i]!=',')
                        tempnum=tempnum*10+(tot[i]-'0');
                        else    
                        {
                                numfound=0;
                        }
                        continue;
                }
                if(tot[i]==' ')
                {
                        flag=1;
                        continue;
                }
                if(flag==1&&tot[i]!=',')
                {
                        if(tot[i]=='=')
                        numfound=1;
                        else
                        temp+=tot[i];
                }
        }

}

^{id}"="{id}[+-/*]{id}"["{id}"]" {
                tot=yytext;
                c=0;
                string var1,var2,var3;
                for(i=0;i<tot.size();i++)
                {
                        if(tot[i]=='='||tot[i]=='+'||tot[i]=='-'||tot[i]=='*'||tot[i]=='/'||tot[i]=='['){
                                c++;
                                continue;
                        }
                        if(c==0)
                                var1+=tot[i];
                        if(c==1)
                                var2+=tot[i];
                        if(c==2)
                                var3+=tot[i];

                }
                int in1,in2,in3;
                in1=mp2[var1];
                in2=mp2[var2];
                in3=mp2[var3];
                if((datatype[in2]=="char"&&datatype[in3]=="int")||(datatype[in3]=="char"&&datatype[in2]=="int"))
                {
                        cout<<"Typecheck error"<<endl;
                        exit(0);
                }
                else
                        cout<<"No error"<<endl;
}

. ;
\n ;
%%

int main()
{
yylex();
cout<<"Lexeme\tDataType\tIndex\n"<<endl;
for(i=0;i<lexeme.size();i++)
{
        cout<<lexeme[i]<<" "<<datatype[i]<<" "<<ind[i]<<endl;
}
return 0;
}                         
