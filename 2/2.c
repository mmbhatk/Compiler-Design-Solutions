#include<stdio.h>
#include<string.h>

int main()
{
	FILE* fp;
	int i, lineno = 0;
	int open = 0, close = 0, openlineno, closelineno;
	char line[100];
	fp = fopen("source.txt", "r");
	if(fp==NULL)
	{
		printf("\nError opening file.\n");
		exit(1);
	}
	printf("\nFile opened successfully.\n\n");
	while(fgets(line, sizeof(line), fp)!=NULL)
	{
		lineno++;
		if(!open && strstr(line, "//"))
		{
			printf("\n%s", line);
			printf("\nSingle line comment on line %d.\n\n", lineno);
		}
		else
		{
			if(open==1 && close==0) printf("\n%s", line);
			if(strstr(line, "/*") && open ==0)
			{
				open = 1;
				close = 0;
				openlineno = lineno;
				printf("\n%s", line);
			}
			if(strstr(line, "*/") && open==1 && close==0)
			{
				open = 0;
				close = 1;
				closelineno = lineno;
				printf("\nComment begins on line %d and terminates on line %d.\n\n", openlineno, closelineno);
			}
		}
	}
	if(open==1 && close==0) printf("\nUnterminated comment begins on line %d.\n\n", openlineno);
	return 0;
}
