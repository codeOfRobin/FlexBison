%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+			yylval=atoi(yytext);return NUMBER;
zone 			return ZONETOK;
file			return FILETOK;
[a-zA-Z][a-zA-Z0-9]*    yylval=strdup(yytext); return WORD;
[a-zA-Z0-9\/.-]+        yylval=strdup(yytext); return FILENAME;
\"                      return QUOTE;
\{                      return OBRACE;
\}                      return EBRACE;
;                       return SEMICOLON;
\n                      /* ignore EOL */;
[\n]|[\w]+		{}


%%


int main
{
	FILE *myFile=fopen("example.txt","r");
	if (!myFile)
		{
			printf("shit. something went wrong");
		}	
}