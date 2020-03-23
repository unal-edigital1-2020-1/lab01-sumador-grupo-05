# lab01- sumador 
laboratorio 01 introducción a HDL

En esta plantilla debe adicionar la documentación del laboratorio

* Miguel Andres Garcia Saenz
* Johan Leonardo Castellanos Ruiz
* Nombres y Apellidos Estudiante 3

## Diferencias entre sum1bcc_primitive.v Y sum1bcc.v

La principal diferencia entre los dos sumadores de un bit es que el primitivo (sum1bcc_primitive.v)
suma los bit mediante el uso de compuertas logicas las cuales realizan la operacion mediante "Algebra Boolena" 
mientras que el sumador (sum1bcc.v) lo hace mediante el uso de registros y la alteracion constate mediante
una operacion de suma basica.

# sum1bcc_primitive.v
~~~
module sum1bcc_primitive (A, B, Ci,Cout,S);

  input  A; //con el input podemos declarar 3 entradas y con output 2 salidas
  input  B;
  input  Ci;
  output Cout;
  output S;

  wire a_ab;  //se declaran los cables que conectan las entradas, estamos declarando la interconexion de las compuertas logicas.
  wire x_ab;
  wire cout_t;
  
  //se declaran las compuertas logicas que realizan la operacion en las entradas del cable, su primer argumento es su salida,                   y los restantes sus entrada
  
  and(a_ab,A,B);  
  xor(x_ab,A,B);

  xor(S,x_ab,Ci);
  and(cout_t,x_ab,Ci);

  or (Cout,cout_t,a_ab);
  
endmodule //la diferencia con (sum1bcc.v) es que este no hace uso de memorias por lo que depende unicamente de operadores logicos y entradas
~~~

# sum1bcc.v
