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
        heat_switch
        |
        target_set
        ;

heat_switch:
        TOKHEAT STATE
        {
                printf("\tHeat turned on or off\n");
        }
        ;

target_set:
        TOKTARGET TOKTEMPERATURE NUMBER
        {
                printf("\tTemperature set\n");
        }
        ;
 %%