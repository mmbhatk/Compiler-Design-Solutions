%{
#include "y.tab.h"
#include<stdio.h>
#include<ctype.h>
extern int yylval;
int val;
%}

%%
[a-zA-Z][a-zA-Z0-9]* {return id;}
[0-9]+[.]?[0-9]* {return num;}
[ \t] ;
\n {return 0;}
. {return yytext[0];}
%%

int yywrap()
{
	return 1;
}

