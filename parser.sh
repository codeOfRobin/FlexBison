yacc example.y
flex tokens.l
cc lex.yy.c y.tab.c  -o  snap
