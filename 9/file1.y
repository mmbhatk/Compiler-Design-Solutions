%{
#include<stdio.h>
int flag = 1;
%}

%token id num
%left '(' ')'
%left '+' '-'
%left '*' '/' '%'
%nonassoc UMinus

%%
S	:	M {printf("\nValid expression. Value of expression: %d.\n", $$);}
	;
M	:	'(' N ')' {printf("\nParanthesis recognized."); $$ = $2;}
	|	N '&''&' N {printf("\nLogical AND recognized."); $$ = (($1) && ($4)); printf("\n%d", $$);}
	|	N '&''&' {printf("\nRight operand missing."); exit(0);}
	|	N '|''|' N {printf("\nLogical OR recognized."); $$ = (($1) || ($4)); printf("\n%d", $$);}
	|	N '|''|' {printf("\nRight operand missing."); exit(0);}
	|	'!' N {printf("\nLogical NOT recognized."); $$ = !($2); printf("\n%d", $$);}
	|	'!' {printf("\nOperand missing."); exit(0);}
	;
N	:	'(' E ')' {printf("\nParanthesis recognized.");}
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
	|	E
	;
E	:	'(' E ')' {printf("\nParanthesis recognized."); $$ = $2;}
	|	E '+' E {printf("\nPlus recognized!"); $$ = $1 + $3; printf("\n%d", $$);}
	|	E '+' {printf("\nSyntax error: Right operand missing."); exit(0);}
	|	E '-' E {printf("\nMinus recognized!"); $$ = $1 - $3; printf("\n%d", $$);}
	|	E '-' {printf("\nSyntax error: Right operand missing."); exit(0);}
	|	E '*' E {printf("\nMultiplication recognized!"); $$ = $1 * $3; printf("\n%d", $$);}
	|	E '*' {printf("\nSyntax error: Right operand missing."); exit(0);}
	|	E '/' E {printf("\nDivision recognized!"); $$ = $1 / $3; printf("\n%d", $$);}
	|	E '/' {printf("\nSyntax error: Right operand missing."); exit(0);}
	|	E '%' E {printf("\nModulus recognized!"); $$ = $1 % $3; printf("\n%d", $$);}
	|	E '%' {printf("\nSyntax error: Right operand missing."); exit(0);}
	|	id
	|	num
	;
%%

main()
{
	printf("\nEnter a logical expression:\n");
	yyparse();
}
yyerror()
{
	printf("\nInvalid logical expression.\n");
	exit(1);
}

