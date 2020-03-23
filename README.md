# lab01- sumador 
laboratorio 01 introducción a HDL

En esta plantilla debe adicionar la documentación del laboratorio

* Miguel Andres Garcia Saenz
* Johan Leonardo Castellanos Ruiz
* Jefersson Garzón Romero

## Diferencias entre sum1bcc_primitive.v Y sum1bcc.v

La principal diferencia entre los dos sumadores de un bit es que el primitivo (sum1bcc_primitive.v)
suma los bit mediante el uso de compuertas logicas las cuales realizan la operacion mediante "Algebra Boolena" 
mientras que el sumador (sum1bcc.v) lo hace mediante el uso de registros y la alteracion constate mediante
una operacion de suma basica.

module sum1bcc_primitive (A, B, Ci,Cout,S);


  input  A;  // declaramos las entradas A, B ,Ci

		//con el input podemos declarar 3 entradas y con output 2 salidas
  input  A;
  input  B;
  input  Ci;
  output Cout;  // Output ---> declara las salidas Cout y S
  output S;



  wire a_ab;    // wire ---> interconexion de las compuertas logicas 
  wire x_ab;
  wire cout_t;	
		 // se declaran las compuertas logicas que realizaran la operacion en las entradas.	

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


// la diferencia con (sum1bcc.v) es que este no hace uso de memorias por lo que la operacion se realiza unicamente con operadores logicos y entradas.

//la diferencia con (sum1bcc.v) es que este no hace uso de memorias por lo que depende unicamente de operadores logicos y entradas
```
![Lógica combinacional](C:\Users\Miguel Garcia\Desktop\UN\ELECTRONICA DIGITAL I\lab01-sumador-grupo-05 "Lógica combinacional")

* Archivo TestBench
```verilog
module sum1bcc_primitive_TB;

  reg x;
  reg y;
  reg c;
  wire out;
  wire z;


sum1bcc_primitive uut(x, y, c,out,z);


initial begin
x=0; y=0; c=0; #3;
x=0; y=0; c=1; #3;
x=0; y=1; c=0; #3;
x=0; y=1; c=1; #3;
x=1; y=0; c=0; #3;
x=1; y=0; c=1; #3;
x=1; y=1; c=0; #3;
x=1; y=1; c=1; #3;



end

initial begin: TEST_CASE
     $dumpfile("sum1bcc_primitive_TB.vcd");
     $dumpvars(-1, uut);
     #(200) $finish;
   end

endmodule
```
errores durante la simulacion Johan Castellanos: No me permite simular cuando le agrego
```verilog
$dumpvars(-1, uut);
```
### sum1bcc.v
```verilog
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
```
* Archivo TestBench
``` verilog
module sum1bcc_TB;

  reg x;
  reg y;
  reg c;
  wire out;
  wire z;


sum1bcc uut(x, y, c,out,z);


initial begin
x=0; y=0; c=0; #3;
x=0; y=0; c=1; #3;
x=0; y=1; c=0; #3;
x=0; y=1; c=1; #3;
x=1; y=0; c=0; #3;
x=1; y=0; c=1; #3;
x=1; y=1; c=0; #3;
x=1; y=1; c=1; #3;



end

initial begin: TEST_CASE
     $dumpfile("sum1bcc_TB.vcd");
     $dumpvars(-1, uut);
     #(200) $finish;
   end

endmodule //
```
errores durante la simulacion Johan Castellanos: No me permite simular cuando le agrego
```verilog
$dumpvars(-1, uut);
```
