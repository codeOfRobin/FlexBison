%{
#include <stdio.h>
#include <string.h>
#define YYSTYPE char *

void yyerror(const char *str)
{
        printf(stderr,"error: %s\n",str);
}
 
int yywrap()
{
        return 1;
} 
  
int main()
{
        yyparse();
        return 1;
} 

%}
%token ZONETOK FILETOK EBRACE OBRACE SEMICOLON FILENAME WORD QUOTE
%%
commands: /* empty */
        | commands command
        ;

command:
        zone_set
        ;
zone_set:
        ZONETOK quotedname zonecontent
        {
                printf("zone set for zone %s \n",$2 );
        }
quotedname:
        QUOTE FILENAME QUOTE
        {
                $$=$2;
        }
zonecontent:
        EBRACE zonestatements OBRACE
zonestatements:
        zonestatement zonestatements SEMICOLON
zonestatement:
        FILETOK quotedname
        {
                printf("A zonefile named %s was found\n",$2 );//check if putting QUOTE filename quote and $ 3 works

        }
block: 
        OBRACE zonestatements EBRACE SEMICOLON
        ;

statements:
        | statements statement
        ;

statement: WORD | block | quotedname

 %%