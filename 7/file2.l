%{
#include "y.tab.h"
#include<stdio.h>
%}

%%
"int"|"float"|"char" {return type;}
[a-zA-Z][a-zA-Z0-9]* {return id;}
[0-9]+[.]?[0-9]* {return num;}
("["[0-9]+"]")+ {return arr;}
[\t] ;
\n {return 0;}
. {return yytext[0];}
%%

int yywrap()
{
	return 1;
}
