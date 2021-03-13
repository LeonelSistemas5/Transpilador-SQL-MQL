package Principal;
import java_cup.runtime.Symbol;

%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/*Palabras Reservadas*/
( SELECT ) {return new Symbol(sym.SELECT, yychar, yyline, yytext());}
( FROM ) {return new Symbol(sym.FROM, yychar, yyline, yytext());}
( WHERE ) {return new Symbol(sym.WHERE, yychar, yyline, yytext());}
( AND ) {return new Symbol(sym.AND, yychar, yyline, yytext());}
( OR ) {return new Symbol(sym.OR, yychar, yyline, yytext());}

/*Ignorar Espacios y Comentarios*/
{espacio} {/*Ignore*/}
( "--"(.)* ) {/*Ignore*/}

/*Operadores*/
( "*" ) {return new Symbol(sym.Todo, yychar, yyline, yytext());}
( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());}
( "!=" ) {return new Symbol(sym.Diferente, yychar, yyline, yytext());}
( "<" ) {return new Symbol(sym.Menor, yychar, yyline, yytext());}
( ">" ) {return new Symbol(sym.Mayor, yychar, yyline, yytext());}
( "<=" ) {return new Symbol(sym.MenorIgual, yychar, yyline, yytext());}
( ">=" ) {return new Symbol(sym.MayorIgual, yychar, yyline, yytext());}
( ":" ) {return new Symbol(sym.Coma, yychar, yyline, yytext());}
( ";" ) {return new Symbol(sym.PuntoComa, yychar, yyline, yytext());}

/*Identificadores y Numeros*/
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/*Error de Analisis*/
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}




