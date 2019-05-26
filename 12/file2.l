%{
#include "y.tab.h"
#include<stdio.h>
%}

%%
"int"|"float" {return type;}
[a-zA-Z][a-zA-Z0-9_]* {return id;}
[ \t] ;
\n {return 0;}
. {return yytext[0];}
%%

int yywrap()
{
	return 1;
}

