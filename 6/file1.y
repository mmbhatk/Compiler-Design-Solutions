%{
#include<stdio.h>
%}

%token id num
%left '(' ')'
%left '+' '-'
%left '/' '*'
%nonassoc UMinus

%%
S	:	E {printf("\nValid expression. Value of expression: %d\n", $$);}
	;
E	:	'(' E ')' {printf("\nParanthesis recognized."); $$ = $2;}
	|	E '+' E {printf("\nPlus recognized!"); $$ = $1 + $3; printf("\n%d", $$);}
	|	'+''+' E {printf("\nPre-increment operator recognized."); $$ = $3 + 1; printf("\n%d", $$);}
	|	E '+' {printf("\nSyntax error: Right operand missing.");}
	|	E '-' E {printf("\nMinus recognized!"); $$ = $1 - $3; printf("\n%d", $$);}
	|	'-''-' E {printf("\Pre-decrement operator recognized."); $$ = $3 - 1; printf("\n%d", $$);}
	|	E '-' {printf("\nSyntax error: Right operand missing.");}
	|	E '*' E {printf("\nMultiplication recognized!"); $$ = $1 * $3; printf("\n%d", $$);}
	|	E '*' {printf("\nSyntax error: Right operand missing.");}
	|	E '/' E {printf("\nDivision recognized!"); $$ = $1 / $3; printf("\n%d", $$);}
	|	E '/' {printf("\nSyntax error: Right operand missing.");}
	|	E '%' E {printf("\nModulus recognized!"); $$ = $1 % $3; printf("\n%d", $$);}
	|	E '%' {printf("\nSyntax error: Right operand missing.");}
	|	id
	|	num
	;
%%

main()
{
	printf("\nEnter an arithmetic expression:\n");
	yyparse();
}
yyerror()
{
	printf("\nInvalid arithmethic expression.\n");
	exit(1);
}
