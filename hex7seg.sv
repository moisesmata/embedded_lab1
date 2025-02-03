module hex7seg(input logic  [3:0] a,
	       output logic [6:0] y);

   /* Replace this comment and the code below it with your solution */
   assign y = { a[2:0], a[3:0] };
   
endmodule
