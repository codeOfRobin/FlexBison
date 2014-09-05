%{
#include <stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+			return NUMBER;
heat			return TOKHEAT;
on|off			return STATE;
temperature		return TOKTEMPERATURE;
target			return TOKTARGET;
[\n]|[\w]+		{}


%%


