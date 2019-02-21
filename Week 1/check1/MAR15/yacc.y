%token ID INTNUM FLOATNUM OP END TYPE
%left '+' '-'
%left '*' '/'
%{
	#include <stdio.h>
	#include <string.h>
	void yyerror(char *);
	int yylex(void);
	int insert(char* type, char* name);
        char* lookup(char* name);
        struct entry {
                char type[7];
                char name[10];
                struct entry *next;
        };
        struct entry* head = NULL;
	char* curtype;
%}

%union {
	char* type;
	int intvalue;
	float floatvalue;
	char* idname;
}

%%
program:
	program statement '\n' {}
	|
	;
statement:
	expr
	| TYPE {
		curtype = (char*) malloc(sizeof($<type>1));
                strcpy(curtype, $<type>1);
	} dlist END
	| ID '=' ID END	{
		if(lookup($<idname>1) == NULL) {
			printf("%s Undeclared\n", $<idname>1);
		} else if(lookup($<idname>3) == NULL) {
			printf("%s Undeclared\n", $<idname>3);
		} else if(strcmp(lookup($<idname>1), lookup($<idname>3)) != 0) {
			if(strcmp(lookup($<idname>1), "char") == 0)      {
                                printf("Error: Cannot cast int(%s) to char\n", $<idname>3);
                        } else if(strcmp(lookup($<idname>1), "int") == 0)	{
				printf("Error: Cannot cast float(%s) to int\n", $<idname>3);
			} else {
				printf("Casting int(%s) to float\n", $<idname>3);
			}
		}
	}
	| ID '=' FLOATNUM END {
		if(lookup($<idname>1) == NULL) {
                        printf("%s Undeclared\n", $<idname>1);
                } else {
                        if(strcmp(lookup($<idname>1), "int") == 0)      {
                                printf("Error: Cannot cast float(%f) to int\n", $<floatvalue>3);
			}
                }
	}
	| ID '=' INTNUM END {
                if(lookup($<idname>1) == NULL) {
                        printf("%s Undeclared\n", $<idname>1);
                } else {
                        if(strcmp(lookup($<idname>1), "float") == 0)      {
                                printf("Casting int(%d) to float\n", $<intvalue>3);
                        }
                }
        }

	;

dlist	:
	dlist ',' ID	{
		//printf("Inserting %s(%s) into symbol table\n", curtype, $<idname>3);
                insert(curtype, $<idname>3);
	}
	| ID	{
		//printf("Inserting %s(%s) into symbol table\n", curtype, $<idname>1);
		insert(curtype, $<idname>1);
	}
	;

expr:
	INTNUM	{ }
	| FLOATNUM	{}
	| expr '+' expr	{}
	| expr '-' expr	{}
	| expr '*' expr {}
	| expr '/' expr {}
	| '(' expr ')'	{}
	;
%%

int insert(char* type, char* name) {
        int count = 0;
        struct entry* temp = head;
        if(head == NULL) {
                head = malloc(sizeof(struct entry));
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

char* lookup(char* name) {
        int count = 0;
        if(head == NULL) return NULL;
        if(strcmp(head->name, name) == 0) {
                return head->type;
        }
        struct entry* temp = head;
        while(temp->next != NULL) {
                if(strcmp(temp->next->name, name) == 0) {
                        return temp->next->type;
                } else {
                        count++;
                }
                temp = temp->next;
        }
        return NULL;
}


void yyerror(char *s) {
	printf("%s\n", s);
}

int main(void) {
	yyparse();
	printf("--Symbol table--\n");
	printf("Type\tName\n");
	struct entry* temp = head;
	while(temp!=NULL) {
		printf("%s\t%s\n", temp->type, temp->name);
		temp = temp->next;
	}
	return 0;
}
