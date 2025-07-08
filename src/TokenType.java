public enum TokenType {
    // Keywords for the 5 components
    IF, ELSE, FOR, INT, SYSTEM, OUT, PRINTLN,

    // Identifier
    IDENTIFIER,

    // Literals
    INTEGER_LITERAL,
    STRING_LITERAL,

    // --- Operators (Expanded) ---
    // Assignment
    ASSIGN,         // =

    // Arithmetic Operators
    PLUS,           // +
    MINUS,          // -
    MULTIPLY,       // *
    DIVIDE,         // /
    MODULO,         // %
    PLUSPLUS,       // ++
    MINUSMINUS,     // --

    // Relational Operators
    EQUAL,          // ==
    NOT_EQUAL,      // !=
    LESS_THAN,      // <
    GREATER_THAN,   // >
    LESS_EQUAL,     // <=
    GREATER_EQUAL,  // >=

    // Logical Operators
    LOGICAL_AND,    // &&
    LOGICAL_OR,     // ||
    LOGICAL_NOT,    // !


    // Separators
    LPAREN,         // (
    RPAREN,         // )
    LBRACE,         // {
    RBRACE,         // }
    SEMICOLON,      // ;
    DOT,            // .
    COMMA,          // ,

    // Control Tokens
    EOF,            // End of File
    ERROR           // Lexical Error
}