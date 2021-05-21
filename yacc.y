%{
#include <stdio.h>
#include <stdlib.h>
extern yylex();
extern yytext[];
extern FILE *yyin;
%}
%start start
%token val compare attribute binary_operation relation regex where open_paren open_bracket closed_bracket closed_paren ERROR
%%
start                   : expression                                                            ;
expression              : one_relation_expression | two_relation_expression                     ;
one_relation_expression : renaming | restriction | projection                                   ;
renaming                : term RENAME attribute AS attribute                                    ;
term                    : relation | ( expression )                                             ;
restriction             : term WHERE comparison                                                 ;
projection              : term | term [ attribute-commalist ]                                   ;
attribute_commalist     : attribute | attribute , attribute-commalist                           ;
two_relation_expression : projection binary-operation expression                                ;
comparison              : attribute compare val                                              ;
%%
int main(int argc, char *argv[])
{
   yyin = fopen(argv[1], "r");
   if (!yyin)
   {
      printf("no file\n");
      exit(0);
   }
   yyparse();
   printf("nofile\n");
}
yyerror()
{
   printf("\nREJECT\n");
//   printf("error from yyerror\n");
   exit(0);
}
yywrap()
{
   printf("in yywarp\n");
   exit(0);
}
