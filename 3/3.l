%{
#include<stdio.h>
int c = 0;
FILE *fp;
%}

%option noyywrap
id [a-zA-Z][a-zA-Z0-9_]*
num [0-9]+(".")?[0-9]*
ar [-+*/%]
re ((<)|(<=)|(>)|(>=)|(==)|(!=))
un (("++")|("--"))
exp ({id}|{num})({arr}|{re})({id}|{num})

%%
\n {c++;}

{id}"="{un}{id} {ECHO; printf("\nValid unary expression in line number: %d.\n\n", c+1);}
{id}"="{id}{un} {ECHO; printf("\nValid unary expression in line number: %d.\n\n", c+1);}
{id}"="{un}{num} {ECHO; printf("\nInvalid unary expression in line number as numbers can't be ++ or --: %d.\n\n", c+1);}
{id}"="{un}{un}+{id} {ECHO; printf("\nConsecutive operators in unary expression in line number: %d.\n\n", c+1);}
{id}"="{id}{un}{un}+ {ECHO; printf("\nConsecutive operators in unary expression in line number: %d.\n\n", c+1);}

{id}"="({id}|{num})({ar}({id}|{num}))+ {ECHO; printf("\nValid arithmetic expression in line number: %d.\n\n", c+1);}
{id}"="{ar}({id}|{num}) {ECHO; printf("\nMissing left operand in arithmetic expression in line number: %d.\n\n", c+1);}
{id}"="({id}|{num}){ar} {ECHO; printf("\nMissing right operand in arithmetic expression in line number: %d.\n\n", c+1);}
{id}"="({id}|{num}){ar}+({id}|{num}) {ECHO; printf("\nConsecutive operators in arithmetic expression in line number: %d.\n\n", c+1);}

{id}"="({id}|{num}){re}({id}|{num}) {ECHO; printf("\nValid relational expression in line number: %d.\n\n", c+1);}
{id}"="{re}({id}|{num}) {ECHO; printf("\nMissing left operand in relational expression in line number: %d.\n\n", c+1);}
{id}"="({id}|{num}){re} {ECHO; printf("\nMissing right operand in relational expression in line number: %d.\n\n", c+1);}
{id}"="({id}|{num}){re}+({id}|{num}) {ECHO; printf("\nConsecutive operators in relational expression in line number: %d.\n\n", c+1);}
. ;

%%

int main(){
    yyin = fopen("source.txt", "r");
    yylex();
    fclose(yyin);
} 	 	 	 		
