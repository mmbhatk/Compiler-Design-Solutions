%{
#include<stdio.h>
#include<stdlib.h>
%}

%token id num

%%
S	:	L '=' R
	|	R
	;
L	:	'*'R
	|	id
	|	num
	;
R	:	L
	;
%%

main()
{
	printf("\nEnter an expression:\n");
	yyparse();
}

yyerror()
{
	printf("\nInvalid expression.\n");
	exit(1);
}
