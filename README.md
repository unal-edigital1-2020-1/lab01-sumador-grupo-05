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

### sum1bcc_primitive.v

Es un sumador bit a bit en el cual se hacen uso de operadores logicos y cables para dar una respuesta de una suma de bits
![Sumador 1bit](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab01-sumador1b/doc/sum1bPuertas.jpg)


 ¨Tomado de Laboratorio 01: introducción al HDL-"https://github.com/unal-edigital1-2020-1/page/blob/master/labs/lab01.md"
 -Propiedad de Ferney Alberto Beltran Molina¨
``` verilog

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
## Sumador de 4 bits
```verilog
`timescale 1ns / 1ps
module sum4b(xi, yi,co,zi);


  input [3 :0] xi; // declara xi como una input de 4 bits
  input [3 :0] yi; // declara yi como una input de 4 bits
  output co;       // declara co como una salida de 1 bit por defecto 
  output [3 :0] zi;// declara zi como una salida de 4 bits

  wire c1,c2,c3;   // decalra los calbles c1,c2,c3
  // suma los bits asignando la posición a una función con las cuatro entradas en las pocisiones correspondientes
  //instanciando a "sumb1bcc.v"
  sum1bcc s0 (.A(xi[0]), .B(yi[0]), .Ci(0),  .Cout(c1) ,.S(zi[0]));
  sum1bcc s1 (.A(xi[1]), .B(yi[1]), .Ci(c1), .Cout(c2) ,.S(zi[1]));
  sum1bcc s2 (.A(xi[2]), .B(yi[2]), .Ci(c2), .Cout(c3) ,.S(zi[2]));
  sum1bcc s3 (.A(xi[3]), .B(yi[3]), .Ci(c3), .Cout(co) ,.S(zi[3]));



endmodule
```
* Archivo TestBench
```verilog
`timescale 1ns / 1ps

module sum4b_TB;

  // Inputs
  reg [3:0] xi;
  reg [3:0] yi;

  // Outputs
  wire co;
  wire [3:0] zi;

  // Instantiate the Unit Under Test (UUT)
  sum4b uut (
    .xi(xi), 
    .yi(yi), 
    .co(co), 
    .zi(zi)
  );

  initial begin
  // Initialize Inputs
    xi=0;
	 for (yi = 0; yi < 16; yi = yi + 1) begin
      if (yi==0)
        xi=xi+1;
      #5 $display("el valor de %d + %d = %d", xi,yi,zi) ;
    end
  end      


initial begin: TEST_CASE
     $dumpfile("sum4b_TB.vcd");
     $dumpvars(-1, uut);
     #(1280) $finish;
   end

endmodule
```
errores durante la simulacion Johan Castellanos: No me permite simular cuando le agrego
```verilog
$dumpvars(-1, uut);
```
![Sumador 4bits respuesta](https://github.com/unal-edigital1-2020-1/lab01-sumador-grupo-05/blob/master/resources/cuatro%20bits.png)
