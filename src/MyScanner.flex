// MyScanner.flex (Final, Simplified, and Correct Version)

// Section 1 (User Code) has been completely removed.
// We will start directly with the options section.
// The file now begins with the JFlex directives.

%%
// =============================================================================
// Section 2: JFlex options and declarations
// =============================================================================
%class Scanner
%public
%unicode
%type Token
%line
%column

// Macros
LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]
Comment        = \/\/[^\r\n]*
Identifier     = [a-zA-Z_][a-zA-Z_0-9]*
IntegerLiteral = 0 | [1-9][0-9]*

%%
// =============================================================================
// Section 3: Lexical Rules
// We now create the Token object directly in each rule.
// =============================================================================
<YYINITIAL> {

  /* --- Ignore Whitespace and Comments --- */
  {WhiteSpace}+         { /* Do nothing */ }
  {Comment}             { /* Do nothing */ }

  /* --- Keywords --- */
  "if"                  { return new Token(TokenType.IF, yytext(), yyline + 1, yycolumn + 1); }
  "else"                { return new Token(TokenType.ELSE, yytext(), yyline + 1, yycolumn + 1); }
  "for"                 { return new Token(TokenType.FOR, yytext(), yyline + 1, yycolumn + 1); }
  "int"                 { return new Token(TokenType.INT, yytext(), yyline + 1, yycolumn + 1); }
  "System"              { return new Token(TokenType.SYSTEM, yytext(), yyline + 1, yycolumn + 1); }
  "out"                 { return new Token(TokenType.OUT, yytext(), yyline + 1, yycolumn + 1); }
  "println"             { return new Token(TokenType.PRINTLN, yytext(), yyline + 1, yycolumn + 1); }

  /* --- Literals --- */
  {IntegerLiteral}      { return new Token(TokenType.INTEGER_LITERAL, yytext(), yyline + 1, yycolumn + 1); }
  \"[^\"]*\"            { return new Token(TokenType.STRING_LITERAL, yytext(), yyline + 1, yycolumn + 1); }

  /* --- Identifier --- */
  {Identifier}          { return new Token(TokenType.IDENTIFIER, yytext(), yyline + 1, yycolumn + 1); }

  /* --- Operators --- */
  "++"                  { return new Token(TokenType.PLUSPLUS, yytext(), yyline + 1, yycolumn + 1); }
  "--"                  { return new Token(TokenType.MINUSMINUS, yytext(), yyline + 1, yycolumn + 1); }
  "=="                  { return new Token(TokenType.EQUAL, yytext(), yyline + 1, yycolumn + 1); }
  "!="                  { return new Token(TokenType.NOT_EQUAL, yytext(), yyline + 1, yycolumn + 1); }
  "<="                  { return new Token(TokenType.LESS_EQUAL, yytext(), yyline + 1, yycolumn + 1); }
  ">="                  { return new Token(TokenType.GREATER_EQUAL, yytext(), yyline + 1, yycolumn + 1); }
  "&&"                  { return new Token(TokenType.LOGICAL_AND, yytext(), yyline + 1, yycolumn + 1); }
  "||"                  { return new Token(TokenType.LOGICAL_OR, yytext(), yyline + 1, yycolumn + 1); }
  "="                   { return new Token(TokenType.ASSIGN, yytext(), yyline + 1, yycolumn + 1); }
  "+"                   { return new Token(TokenType.PLUS, yytext(), yyline + 1, yycolumn + 1); }
  "-"                   { return new Token(TokenType.MINUS, yytext(), yyline + 1, yycolumn + 1); }
  "*"                   { return new Token(TokenType.MULTIPLY, yytext(), yyline + 1, yycolumn + 1); }
  "/"                   { return new Token(TokenType.DIVIDE, yytext(), yyline + 1, yycolumn + 1); }
  "%"                   { return new Token(TokenType.MODULO, yytext(), yyline + 1, yycolumn + 1); }
  "<"                   { return new Token(TokenType.LESS_THAN, yytext(), yyline + 1, yycolumn + 1); }
  ">"                   { return new Token(TokenType.GREATER_THAN, yytext(), yyline + 1, yycolumn + 1); }
  "!"                   { return new Token(TokenType.LOGICAL_NOT, yytext(), yyline + 1, yycolumn + 1); }

  /* --- Separators --- */
  "("                   { return new Token(TokenType.LPAREN, yytext(), yyline + 1, yycolumn + 1); }
  ")"                   { return new Token(TokenType.RPAREN, yytext(), yyline + 1, yycolumn + 1); }
  "{"                   { return new Token(TokenType.LBRACE, yytext(), yyline + 1, yycolumn + 1); }
  "}"                   { return new Token(TokenType.RBRACE, yytext(), yyline + 1, yycolumn + 1); }
  ";"                   { return new Token(TokenType.SEMICOLON, yytext(), yyline + 1, yycolumn + 1); }
  "."                   { return new Token(TokenType.DOT, yytext(), yyline + 1, yycolumn + 1); }
  ","                   { return new Token(TokenType.COMMA, yytext(), yyline + 1, yycolumn + 1); }
}

/* --- Error Handling --- */
[^]                   { return new Token(TokenType.ERROR, yytext(), yyline + 1, yycolumn + 1); }