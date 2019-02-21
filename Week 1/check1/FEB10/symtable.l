%{
        #include <stdlib.h>
        #include <string.h>
        //#include "y.tab.h"
        int insert(char* type, char* name);
        int lookup(char* name);
        struct entry {
                char type[7];
                char name[10];
                struct entry *next;
        };
        struct entry* head = NULL;
%}

type    (int|float|char)
digit   [0-9]
letter  [a-zA-Z]

%%
{type}[ ]{letter}({letter}|{digit})*    {
        char text[20];
        strcpy(text, yytext);
        int ret = lookup(strchr(yytext, ' ')+1);
        if(ret != -1) {
                printf("Variable %s already declared\n", yytext);
        } else {
                int index = insert(strtok(text, " "), strchr(yytext, ' ')+1);
        }
}
{letter}({letter}|{digit})* {
        int ret = lookup(yytext);
        if(ret == -1) {
                printf("Variable %s undeclared\n", yytext);
        }
}
[ \t\n]
.
%%

int yywrap(void) {
        return 1;
}

int insert(char* type, char* name) {
        int count = 0;
        struct entry* temp = head;
        if(head == NULL) {
head=malloc(sizeof(struct entry));
                strcpy(head->type, type);
                strcpy(head->name, name);
                head->next = NULL;
                return 0;
        }
        while(temp->next != NULL) {
                temp = temp->next;
                count++;
        }
        temp->next = malloc(sizeof(struct entry));
        strcpy(temp->next->type, type);
        strcpy(temp->next->name, name);
        temp->next->next = NULL;
        return count+1;
}

int lookup(char* name) {
        int count = 0;
        if(head == NULL) return -1;
        if(strcmp(head->name, name) == 0) {
                return 0;
        }
        struct entry* temp = head;
        while(temp->next != NULL) {
                if(strcmp(temp->next->name, name) == 0) {
                        return count;
                } else {
                        count++;
                }
                temp = temp->next;
        }
        return -1;
}

int main() {
        yylex();
        int count = 0;
        struct entry* temp = head;
        while(temp != NULL) {
                printf("%d\t%s\t%s\n", count, temp->name, temp->type);
                temp = temp->next;
                count++;
        }
}
