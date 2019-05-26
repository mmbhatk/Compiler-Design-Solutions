%{
#include<stdio.h>
int c = 0;
FILE *fp;
%}

%option noyywrap
id [a-zA-Z][a-zA-Z0-9_]*
op "{"
cl "}"
type "int"|"float"|"char"

%%
\n {c++;}
"struct"" "{id}{op}({type}" "{id}(","{id})*";")+{cl}";" {ECHO; printf("\nValid structure declaration in line: %d.\n\n", c+1);}
"struct"" "{id}{op}{type}" "{id}(","{id})*{cl}";" {ECHO; printf("\nMissing semi-colon inside structure declaration in line: %d.\n\n", c+1);}
"struct"" "{id}{op}{cl}";" {ECHO; printf("\nEmpty structure declaration in line: %d.\n\n", c+1);}
"struct"" "{id}{op}.*{cl} {ECHO; printf("\nMissing semi-colon at the end of structure declaration in line: %d.\n\n", c+1);}
"struct"{op}.*{cl}";" {ECHO; printf("\nMissing name in structure declaration in line: %d.\n\n", c+1);}
. ;
%%

int main(){
    yyin = fopen("source.txt", "r");
    yylex();
    fclose(yyin);
}
