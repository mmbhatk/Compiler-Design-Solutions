#include<stdio.h>
#include<string.h>

int main()
{
	FILE* fp;
	int i, string, strcheck, open, close, lineno = 0;
	char line[100];
	fp = fopen("file.txt", "r");
	if(fp==NULL)
	{
		printf("\nFile cannot be opened.\n");
		exit(0);
	}
	printf("\nFile successfully opened.\n");
	while(fgets(line, sizeof(line), fp)!=NULL)
	{
		lineno++;
		open = close = 0;
		string = strcheck = 0;
		for(i = 0; i<strlen(line); i++)
		{
			if(line[i]=='"')
			{
				string = 1;
				if(open==0 && close==0) open = 1;
				else if(open==1 && close==0) close = 1;
				else if(open==1 && close==1) close = 0;
			}
		}
		if(open==1 && close==0)
		{
			printf("\nUnterminated string on line %d.\n", lineno);
			strcheck = 1;
		}
		if(string==1 && strcheck==0) printf("\nString usage validated on line %d.\n", lineno);
	}
	return 0;
}
