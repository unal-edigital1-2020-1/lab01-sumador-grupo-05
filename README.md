# lab01- sumador 
laboratorio 01 introducción a HDL

En esta plantilla debe adicionar la documentación del laboratorio

* Miguel Andres Garcia Saenz
* Johan Leonardo Castellanos Ruiz
* Nombres y Apellidos Estudiante 3


Comprenda cada línea del código HDL del archivo sum1bcc_primitive.v y sum1bcc.v que se encuentra en la carpera src. Si cree necesario realice los respectivos comentarios en el mismo archivo y comente las diferencias entre las dos descripciones.
module sum1bcc_primitive (A, B, Ci,Cout,S);

```verilog

module sum1bcc_primitive (A, B, Ci,Cout,S);

  input  A;
  input  B;
  input  Ci;
  output Cout;
  output S;


  wire a_ab;
  wire x_ab;
  wire cout_t;

  and(a_ab,A,B);
  xor(x_ab,A,B);

  xor(S,x_ab,Ci);
  and(cout_t,x_ab,Ci);

  or (Cout,cout_t,a_ab);

endmodule
```
*Analice la simulación de cada uno de los archivos y compruebe que el sumador funciona correctamente.

*Cree el nuevo proyecto HDL para el sumador de 4 bit, onde el top sea sum4bcc.v e instancie el sumador de 1 bit sum1bcc.v

*Creer el archivo testbench.v

*Genera la simulación, Revise que el sistema funciona como usted lo esperaba. Realice lo comentarios necesarios en el archivo README.md.

*Realice la respectiva publicación del repositorio antes de la fecha dada con todo el código fuente

## Diferencias entre sum1bcc_primitive.v Y sum1bcc.v

La principal diferencia entre los dos sumadores de un bit es que el primitivo (sum1bcc_primitive.v)
suma los bit mediante el uso de compuertas logicas las cuales realizan la operacion mediante "Algebra Boolena" 
mientras que el sumador (sum1bcc.v) lo hace mediante el uso de registros y la alteracion constate mediante
una operacion de suma basica.


