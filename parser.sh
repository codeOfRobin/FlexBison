flex tokens.l
yacc -d example.y
cc lex.yy.c y.tab.c  -o  snap
