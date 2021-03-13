package Principal;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class principal {
    
    public static void main(String[] args) throws Exception {
        String ruta1 = "E:/ING_Sistemas/Java_cod/Compiladores/TraductorSQLMQL/SQLMQL/src/Principal/Lexer.flex";
        String ruta2 = "E:/ING_Sistemas/Java_cod/Compiladores/TraductorSQLMQL/SQLMQL/src/Principal/LexerCup.flex";
        String[] rutaS = {"-parser", "Sintax", "E:/ING_Sistemas/Java_cod/Compiladores/TraductorSQLMQL/SQLMQL/src/Principal/Sintax.cup"};
        generar(ruta1, ruta2, rutaS);
    }
    
    public static void generar(String ruta1, String ruta2, String[] rutaS) throws IOException, Exception{
        File archivo;
        archivo = new File(ruta1);
        JFlex.Main.generate(archivo);
        archivo = new File(ruta2);
        JFlex.Main.generate(archivo);
        java_cup.Main.main(rutaS);
        
        Path rutaSym = Paths.get("E:/ING_Sistemas/Java_cod/Compiladores/TraductorSQLMQL/SQLMQL/src/Principal/sym.java");
        if (Files.exists(rutaSym)) {
            Files.delete(rutaSym);
        }
        Files.move(
                Paths.get("E:/ING_Sistemas/Java_cod/Compiladores/TraductorSQLMQL/SQLMQL/sym.java"), 
                Paths.get("E:/ING_Sistemas/Java_cod/Compiladores/TraductorSQLMQL/SQLMQL/src/Principal/sym.java")
        );
        Path rutaSin = Paths.get("E:/ING_Sistemas/Java_cod/Compiladores/TraductorSQLMQL/SQLMQL/src/Principal/Sintax.java");
        if (Files.exists(rutaSin)) {
            Files.delete(rutaSin);
        }
        Files.move(
                Paths.get("E:/ING_Sistemas/Java_cod/Compiladores/TraductorSQLMQL/SQLMQL/Sintax.java"), 
                Paths.get("E:/ING_Sistemas/Java_cod/Compiladores/TraductorSQLMQL/SQLMQL/src/Principal/Sintax.java")
        );
    }
    
}
