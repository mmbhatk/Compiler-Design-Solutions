%{
#include<stdio.h>
#include<stdlib.h>
%}

%token type id

%%
D	:	T ' ' L
	;
T	:	type
	;
L	:	L ',' id
	|	id
	;
%%

main()
{
	printf("\nEnter an expression:\n");
	yyparse();
	printf("\nValid expression.\n");
}
yyerror()
{
	printf("\nInvalid expression.\n");
	exit(1);
}
