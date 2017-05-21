%{
#include <stdio.h>
#include "grammar.lex.c"
#include <iostream>

extern "C" {
    void yyerror(char *s) {
        std::cerr << "line " << yylineno << ": " << s << std::endl;
    }

    int yywrap(void) {
        return 1;
    }
}
%}

%start program

%token CREATE_KEYWORD WRITEPROC_KEYWORD READPROC_KEYWORD TABLE_KEYWORD
%token RPAREN LPAREN SEMICOLON COMMA
%token IDENTIFIER
%token BAD_CHARACTER
%%

program: program_element_list
    ;

program_element_list: program_element
    | program_element_list program_element

program_element: table_definition
    ;

table_definition: CREATE_KEYWORD TABLE_KEYWORD table_name table_contents_source SEMICOLON
    ;

table_contents_source: LPAREN table_element_list RPAREN
    ;

table_element_list: table_element
    | table_element_list COMMA table_element
    ;

table_element: column_definition
    ;

column_definition: column_name data_type
    ;

table_name: IDENTIFIER
    ;

column_name: IDENTIFIER
    ;

data_type: IDENTIFIER
    ;
%%