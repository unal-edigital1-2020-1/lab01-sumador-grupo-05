module sum1bcc (A, B, Ci,Cout,S);
  //se declaran las entradas siendo dos entradas (A y B) variables (ci) siendo la carga del bit de entrada
  //se declaran las salidas siendo la salida (S) una funcion dependiente de (A,B,Ci) y nua carga de salida Cout
  //se declaran las entradas A, B , Ci y salidas Cout , S
  input  A;
  input  B;
  input  Ci;
  output Cout;
  output S;
  
  //se declara un registro (st) el cual pose un tamaño de 2 bits [dede 1:hasta 0] 
  //se le asigna la salida el valor de la posicion 0 del registro y a la caraga el valor de la posicion 1 del registro
  //se crea (st) el cual asigna a la salida y a la entrada el valor 0 y 1 respectivamente
  reg [1:0] st;
  assign S = st[0];
  assign Cout = st[1];
// se crea la operacion la cual funciona siempre que se presente un cabio en las entradas, la funcion es st=A+B+Ci
//cuando st presenta un cambio las salidas a las cuales hace referencia tambien cambian
// se crea la funcion st que depende de los valores en las entradas A, B, Ci
  always @ ( * ) begin
  	st  = 	A+B+Ci;
  end
  
endmodule
// la diferencia con (sum1bcc_primitive.v) es que este hace uso de memorias para evitar el uso de operadores logicos
// se hace el uso de memoria para no utilizar los operadores logicos and,  xor,  or.  