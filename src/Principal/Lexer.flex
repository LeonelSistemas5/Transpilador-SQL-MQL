package Principal;
import static Principal.Tokens.*;

%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r]+
%{
    public String lexeme;
%}
%%

/*Palabras Reservadas*/
( SELECT ) {lexeme=yytext(); return SELECT;}
( FROM ) {lexeme=yytext(); return FROM;}
( WHERE ) {lexeme=yytext(); return WHERE;}
( AND ) {lexeme=yytext(); return AND;}
( OR ) {lexeme=yytext(); return OR;}

/*Ignorar Espacios y Comentarios*/
{espacio} {/*Ignore*/}
( "--"(.)* ) {/*Ignore*/}

/*Operadores*/
( "\n" ) {lexeme=yytext(); return Linea;}
( "*" ) {lexeme=yytext(); return Todo;}
( "=" ) {lexeme=yytext();return Igual;}
( "!=" ) {lexeme=yytext(); return Diferente;}
( "<" ) {lexeme=yytext(); return Menor;}
( ">" ) {lexeme=yytext(); return Mayor;}
( "<=" ) {lexeme=yytext(); return MenorIgual;}
( ">=" ) {lexeme=yytext(); return MayorIgual;}
( ":" ) {lexeme=yytext(); return Coma;}
( ";" ) {lexeme=yytext(); return PuntoComa;}

/*Identificadores y Numeros*/
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}

/*Error de Analisis*/
 . {return ERROR;}



