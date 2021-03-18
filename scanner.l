/* Compiler Theory and Design
 */

/* This file contains flex input file */
/**
 * File: scanner.l
 * Author: Amanda Hajati
 * Project: Project 1
 * Date: March 29, 2020
 * Description: defines what lexemes go with the tokens and set up reserved words.
 */
%{
#include <cstdio>
#include <string>

using namespace std;

#include "listing.h"
#include "tokens.h"

%}

%option noyywrap

ws		[ \t\r]+
comment		\-\-.*\n
line		[\n]
id		[A-Za-z][_]?[A-Za-z0-9]*
digit		[0-9]
int		{digit}+
punc		[\(\),:;]
realliteral [0-9]+[.][0-9]*[eE]?+[+-][0-9]+

%%

{ws}		{ ECHO; }
{comment}	{ ECHO; nextLine();}
{line}		{ ECHO; nextLine();}
"<"		{ ECHO; return(RELOP); }
"+"		{ ECHO; return(ADDOP); }
"-"     { ECHO; return(ADDOP); }
"/"     { ECHO; return(MULOP); }
"*"		{ ECHO; return(MULOP); }
"=>"    { ECHO; return(ARROW); }
"or"      { ECHO; return(OROP);  }
"not"     { ECHO; return(NOTOP); }
"="     { ECHO; return(RELOP); }
"/="    { ECHO; return(RELOP);    }
">"     { ECHO; return(RELOP);    }
">="    { ECHO; return(RELOP);    }
"<="    { ECHO; return(RELOP);    }
"rem"     { ECHO; return(REMOP);    }
"**"    { ECHO; return(EXPOP);    }
begin		{ ECHO; return(BEGIN_); }
boolean		{ ECHO; return(BOOLEAN); }
end		{ ECHO; return(END); }
endreduce	{ ECHO; return(ENDREDUCE); }
function	{ ECHO; return(FUNCTION); }
integer		{ ECHO; return(INTEGER); }
is		{ ECHO; return(IS); }
reduce		{ ECHO; return REDUCE; }
returns		{ ECHO; return(RETURNS); }
and		{ ECHO; return(ANDOP);   }
case    { ECHO; return(CASE);    }
else    { ECHO; return(ELSE);    }
endcase { ECHO; return(ENDCASE); }
endif   { ECHO; return(ENDIF);   }
if      { ECHO; return(IF);      }
others  { ECHO; return(OTHERS);  }
real    { ECHO; return(REAL);    }
then    { ECHO; return(THEN);    }
when    { ECHO; return(WHEN);    }
true    { ECHO; return(BOOL_LITERAL);}
false   { ECHO; return(BOOL_LITERAL);}
{id}		{ ECHO; return(IDENTIFIER);}
{int}		{ ECHO; return(INT_LITERAL); }
{punc}		{ ECHO; return(yytext[0]); }
{realliteral} 	{ ECHO; return(REAL_LITERAL); }
.		{ ECHO; appendError(LEXICAL, yytext); }
%%

int main()
{
	firstLine();
	
	FILE *file = fopen("lexemes.txt", "wa"); 
	int token = yylex();
	while (token)
	{
		fprintf(file, "%d %s\n", token, yytext);
		token = yylex();
	}
	lastLine();
	fclose(file);

	return 0;
}
