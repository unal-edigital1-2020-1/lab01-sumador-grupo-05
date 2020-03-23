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
//con el input podemos declarar 3 entradas y con output 2 salidas
  input  A;
  input  B;
  input  Ci;
  output Cout;
  output S;

//se declaran los cables que conectan las entradas, estamos declarando la interconexion de las compuertas logicas
  wire a_ab;
  wire x_ab;
  wire cout_t;
//se declaran las compuertas logicas que realizan la operacion en las entradas del cable, su primer argumento es su salida, y los restantes sus entrada
  and(a_ab,A,B);
  xor(x_ab,A,B);

  xor(S,x_ab,Ci);
  and(cout_t,x_ab,Ci);

  or (Cout,cout_t,a_ab);
endmodule
//la diferencia con (sum1bcc.v) es que este no hace uso de memorias por lo que depende unicamente de operadores logicos y entradas


module sum1bcc (A, B, Ci,Cout,S);
  //se declaran las entradas siendo dos entradas (A y B) variables (ci) siendo la carga del bit de entrada
  //se declaran las salidas siendo la salida (S) una funcion dependiente de (A,B,Ci) y nua carga de salida Cout
  input  A;
  input  B;
  input  Ci;
  output Cout;
  output S;
  //se declara un registro (st) el cual pose un tamaño de 2 bits [dede 1:hasta 0] 
  //se le asigna la salida el valor de la posicion 0 del registro y a la caraga el valor de la posicion 1 del registro
  reg [1:0] st;
  assign S = st[0];
  assign Cout = st[1];
// se crea la operacion la cual funciona siempre que se presente un cabio en las entradas, la funcion es st=A+B+Ci
//cuando st presenta un cambio las salidas a las cuales hace referencia tambien cambian
  always @ ( * ) begin
  	st  = 	A+B+Ci;
  end
  
endmodule
```
// la diferencia con (sum1bcc_primitive.v) es que este hace uso de memorias para evitar el uso de operadores logicos
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


