#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main()
{
	FILE* fp;
	int i, lineno = 0, open = 0, openlineno;
	char line[100];

	fp = fopen("source.txt", "r");

	while(fgets(line, sizeof(line), fp))
	{
		lineno++;
		for(i = 0; i < strlen(line); i++)
		{
			if(open) printf("%c", line[i]);
			if(!open && line[i] == '\'')
			{
				if((i+2)<strlen(line) && line[i+2]=='\'') {printf("\n%sValid character constant %c on line %d.\n\n", line, line[i+1], lineno); i+=2;}
				else {printf("\n%sInvalid character constant on line %d.\n\n", line, lineno);}
			}
			if(!open && line[i] == '"') {open = 1; openlineno = lineno; printf("\n%c", line[i]);}
			else if(open && line[i] == '"') {open = 0; printf("\nString begins on line %d and ends on line %d.\n\n", openlineno, lineno);}
		}
	}
	if(open) printf("\nUnterminated string begins on line %d.\n", openlineno);
}
