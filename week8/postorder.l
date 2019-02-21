%{
       char inorder[100],preorder[100];
        int flag=0,in=0,pre=0;
%}

%%
[a-zA-Z0-9] {
        if(flag == 0){
                inorder[in++] = yytext[0];
                inorder[in] = '\0';
        }
        else{
                preorder[pre++] = yytext[0];
                preorder[pre] = '\0';
        }
}

\n flag = 1;
. ;
%%

static int itr=0;
static int check[100]={0};
int getIndex(int a){
        int i;
        for(i=0;i<in;i++)
                if(inorder[i] == a)
                        return i;
}

void postorder(int start,int end){
        if(start<end){
                int root = getIndex(preorder[itr++]);
                postorder(start,root-1);
                postorder(root+1,end);
                if(check[root] == 0){
                        printf("%c",inorder[root]);
                        check[root] = 1;
                }
        }
        else{
                if(check[start] == 0){
                        printf("%c",inorder[start]);
                        check[start] = 1;
                }
                itr++;
        }
             
}

int main(){
        yylex();
        postorder(0,in-1);
        return 0;
}

