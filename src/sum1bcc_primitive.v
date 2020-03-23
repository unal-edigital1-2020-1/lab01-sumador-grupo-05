module sum1bcc_primitive (A, B, Ci,Cout,S);

  input  A;  // declaramos las entradas A, B ,Ci
  input  B;
  input  Ci;
  output Cout; // Output ---> declara las salidas Cout y S
  output S;


  wire a_ab;    // wire ---> interconexion de las compuertas logicas 
  wire x_ab;
  wire cout_t;	
		 // se declaran las compuertas logicas que realizaran la operacion en las entradas.	
  and(a_ab,A,B);
  xor(x_ab,A,B);

  xor(S,x_ab,Ci);
  and(cout_t,x_ab,Ci);

  or (Cout,cout_t,a_ab);
endmodule

// la diferencia con (sum1bcc.v) es que este no hace uso de memorias por lo que la operacion se realiza unicamente con operadores logicos y entradas.
