%{
#include<stdio.h>
#include<stdlib.h>
%}

%token type id num arr

%%
S	:	T ' ' L ';'
	|	T ' ' L {printf("\nInvalid. Missing semicolon.\n"); exit(0);}
	;
T	:	type
	;
L	:	L ',' L	
	|	id arr
	|	id '['num {printf("\nMissing closing bracket.\n"); exit(0);}
	|	id '[' ']' {printf("\nMissing array size.\n"); exit(0);}
	|	id '[' id ']' {printf("\nArray size cannot be an ID.\n"); exit(0);}
	|	id '[' num '.' ']' {printf("\nArray size cannot be float.\n"); exit(0);}
	|	id '[' num '.' num ']' {printf("\nArray size cannot be float.\n"); exit(0);}
	|	id
	;
%%

main()
{
	printf("\nEnter a declarative statement:\n");
	yyparse();
	printf("\nValid declaration.\n");
}
yyerror()
{
	printf("\nInvalid declaration.\n");
	exit(1);
}
