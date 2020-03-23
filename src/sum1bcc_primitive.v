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
