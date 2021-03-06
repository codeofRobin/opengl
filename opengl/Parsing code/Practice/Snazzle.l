%{
#include <cstdio>
#include <iostream>
using namespace std;
#define YY_DECL extern "C" int yylex()

#include "snazzle.tab.h"  // to get the token types that we return

%}
%%
[ \t\n]           ;
[0-9]+\.[0-9]+ { yylval.fval = atof(yytext); return FLOAT; }
[0-9]+            { yylval.ival = atoi(yytext); return INT; }
[a-zA-Z0-9]+      {
    // we have to copy because we can't rely on yytext not changing underneath us:
    yylval.sval = strdup(yytext);
    return STRING;
}
.                ;
%%
