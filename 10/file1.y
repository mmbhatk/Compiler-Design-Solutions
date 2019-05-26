%{
#include<stdio.h>
%}

%token id
%left '(' ')'

%%
S	:	S S '*'
	|	S S '+'
	|	id
	|	'(' S ')'
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
