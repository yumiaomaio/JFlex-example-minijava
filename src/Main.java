import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {

        String subDirectory = "src";

        List<String> fileNames = List.of(
                "test_correct_1.txt",
                "test_correct_2.txt",
                "test_error_1.txt",
                "test_error_2.txt"
        );

        List<String> filesToAnalyze = new ArrayList<>();
        for (String fileName : fileNames) {
            filesToAnalyze.add(subDirectory + File.separator + fileName);
        }

        String currentDir = System.getProperty("user.dir");
        System.out.println(">>> Current Working Directory: " + currentDir);
        System.out.println(">>> Searching for test files in the '" + subDirectory + "' subdirectory...");

        for (String filePath : filesToAnalyze) { // 使用新的文件路径列表
            System.out.println("\n\n===================================================================");
            System.out.println(">>> Analyzing file: " + filePath);
            System.out.println("===================================================================");

            try (Reader reader = new FileReader(filePath)) {
                Scanner scanner = new Scanner(reader);

                System.out.printf("%-20s\t%-20s\t%s%n", "Lexeme", "Token Type", "Token");
                System.out.println("-------------------------------------------------------------------");

                Token token;
                while ((token = scanner.yylex()) != null) {
                    if (token.type == TokenType.ERROR) {
                        System.out.printf("!!! Lexical Error: Unexpected character '%s' at line %d, column %d%n",
                                token.lexeme, token.line, token.column);
                    }
                    System.out.printf("%-20s\t%-20s\t%s%n", token.lexeme, token.type, token.type);
                }

            } catch (IOException e) {
                System.err.println("\n[ERROR] Could not read file: " + filePath);
                System.err.println("Please make sure you are running this from the project root directory (jfelx01):");
                System.err.println("-> " + currentDir);
            }
        }

        System.out.println("\n\n>>> All files have been analyzed.");
    }
}