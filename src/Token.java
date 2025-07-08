// Token.java
// This class is a data structure to hold all information about a single token.

public class Token {
    public final TokenType type;
    public final String lexeme;
    public final int line;
    public final int column;

    public Token(TokenType type, String lexeme, int line, int column) {
        this.type = type;
        this.lexeme = lexeme;
        this.line = line;
        this.column = column;
    }

    @Override
    public String toString() {
        return "Token [type=" + type + ", lexeme='" + lexeme + "', line=" + line + ", column=" + column + "]";
    }
}