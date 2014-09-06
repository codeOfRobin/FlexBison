%{
#include <stdio.h>
#include <string.h>
 
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
%token NUMBER TOKHEAT STATE TOKTARGET TOKTEMPERATURE
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
 %%