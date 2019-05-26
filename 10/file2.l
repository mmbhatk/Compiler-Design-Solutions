%{
#include "y.tab.h"
#include<stdio.h>
#include<ctype.h>
extern int yylval;
%}

%%
[a] {return id;}
[ \t] ;
\n {return 0;}
. {return yytext[0];}
%%

int yywrap()
{
	return 1;
}
