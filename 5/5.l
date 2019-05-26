%{
#include<stdio.h>
int c = 0;
FILE *fp;
%}

%option noyywrap
id [a-zA-Z][a-zA-Z0-9_]*
num [0-9]+(".")?[0-9]*
op ((<)|(<=)|(>)|(>=)|(==)|(!=))
ws [ \t\n]*
exp ({id}|{num})({op}({id}|{num}))?

%%
\n {c++;}
"if""("{exp}")"{ws}"{".*"}"{ws}("else if""("{exp}")"{ws}"{".*"}"{ws})*"else"{ws}"{".*"}"{ws}("else"{ws}"{".*"}")+ {ECHO; printf("\nInvalid if-elseif-else. Multiple else in line no: %d.\n\n", c+1);}
"if""("{exp}")"{ws}"{".*"}"{ws}("else if""("{exp}")"{ws}"{".*"}"{ws})*"else"{ws}"{".*"}" {ECHO; printf("\nValid if elseif else in line no: %d.\n\n", c+1);}
"if""("{exp}")"{ws}"{".*"}"{ws}("else if""("{exp}")"{ws}"{".*"}"{ws})* {ECHO; printf("\nInvalid if-elseif-else. Ends without else in line no: %d\n\n", c+1);}
"if""("({id}|{num}){op}({id}|{num})({op}({id}|{num}))+")"{ws}"{".*"}"{ws}("else if""("{exp}")"{ws}"{".*"}"{ws})*"else"{ws}"{".*"}" {ECHO; printf("\nInvalid if-elseif-else. Too many conditions in the if-statement in line no: %d.\n\n", c+1);}
. ;
%%

int main(){
    yyin = fopen("source.txt", "r");
    yylex();
    fclose(yyin);
}
