#include<stdio.h>
#include<stdlib.h>
#include<string.h>

int main()
{
	FILE* fp;
	int lineno = 0, open = 0, openlineno;
	char line[100];

	fp = fopen("source.txt", "r");
	if(fp) {printf("\nFile opened successfully.\n\n");}

	while(fgets(line, sizeof(line), fp))
	{
		lineno++;
		if(open) printf("\n%s", line);
		if(!open && strstr(line, "//")) printf("\n%s\nSingle line comment on line: %d\n\n", line, lineno);
		if(!open && strstr(line, "/*")) {open = 1; openlineno = lineno; printf("\n%s", line);}
		if(open && strstr(line, "*/"))
		{
			printf("\nMultiline comment begins on line %d and ends on line %d.\n\n", openlineno, lineno);
			open = 0;
		}
	}

	if(open) printf("\nUnterminated comment begins on line %d.\n", openlineno);
}
