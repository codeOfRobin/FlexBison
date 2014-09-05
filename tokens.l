%{
#include <stdio.h>
%}

%%
[a-zA-Z_]*		{printf("word");}
[a-zA-Z_/\.-]+  	{printf("filepath");}
\"				{printf("quotes");}
\{				{printf("leftBrace");}
\}				{printf("rightBrace");}
;				{printf("semicolon");}
[\t\n]			{}

%%


int main()
{
	FILE *myFile=fopen("example.txt","r");
	if (!myFile)
		{
			printf("error");
			return -2;
		}

	else
	{
		yyin=myFile;
	}

	yylex();
	return 1;
}