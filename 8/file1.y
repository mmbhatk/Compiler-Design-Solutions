%{
#include<stdio.h>
int flag = 1;
%}

%token id num
%left '(' ')'
%left '+' '-'
%left '*' '/'
%nonassoc UMinus

%%
S	:	M {printf("\nValid expression.");}
	;
M	:	'(' E ')' {printf("\nParanthesis recognized.");}
	|	E '<' E {printf("\nLess than recognized."); $$ = ($1 < $3); printf("\n%d", $$);}
	|	E '<' {printf("\nSyntax error. Right operand missing."); exit(0);}
	|	E '>' E {printf("\nGreater than recognized."); $$ = ($1 > $3); printf("\n%d", $$);}
	|	E '>' {printf("\nSyntax error. Right operand missing."); exit(0);}
	|	E '<''=' E {printf("\nLess than or equal to recognized."); $$ = ($1 <= $4); printf("\n%d", $$);}
	|	E '<''=' {printf("\nSyntax error. Right operand missing."); exit(0);}
	|	E '>''=' E {printf("\nGreater than or equal to recognized."); $$ = ($1 >= $4); printf("\n%d", $$);}
	|	E '>''=' {printf("\nSyntax error. Right operand missing."); exit(0);}
	|	E '!''=' E {printf("\nNot equal to recognized."); $$ = ($1 != $4); printf("\n%d", $$);}
	|	E '!''=' {printf("\nSyntax error. Right operand missing."); exit(0);}
	|	E '=''=' E {printf("\nEqual to recognized."); $$ = ($1 == $4); printf("\n%d", $$);}
	|	E '=''=' {printf("\nSyntax error. Right operand missing."); exit(0);}
	;
E	:	'(' E ')' {printf("\nParanthesis recognized."); $$ = $2;}
	|	E '+' E {printf("\nPlus recognized!"); $$ = $1 + $3; printf("\n%d", $$);}
	|	E '+' {printf("\nSyntax error: Right operand missing.");}
	|	E '-' E {printf("\nMinus recognized!"); $$ = $1 - $3; printf("\n%d", $$);}
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
	printf("\nEnter a relational expression:\n");
	yyparse();
}
yyerror()
{
	printf("\nInvalid relational expression.\n");
	exit(1);
}
