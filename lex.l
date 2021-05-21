%{
#include "p3.tab.h"
extern int yylval;
%}
Delimiter           [ \t\n\r]
WhiteSpace          {Delimiter}+
val                 [0-9]+
compare             [<|>|<=|>=|=|<>]
attribute           CNO|CITY|CNAME|SNO|PNO|TQTY|SNAME|QUOTA|PNAME|COST|AVQTY|S#|STATUS|P#|COLOR|WEIGHT|QTY
binary_operation    UNION|INTERSECT|MINUS|TIMES|JOIN|DIVIDEBY
relation            S|P|SP|PRDCT|CUST|ORDERS
%%
{WhiteSpace}                    ;
{val}                           return(val);
{compare}                       return(compare);
{attribute}                     return(attribute);
{binary_operation}              return(binary_operation);
{relation}                      return(relation);
"REGEX"                         return(regex);
"WHERE"                         return(where);
"("                             return(open_paren);
"["                             return(open_bracket);
"]"                             return(closed_bracket);
")"                             return(closed_paren);
"AS"                            return(AS);
.                               return(ERROR);
%%
