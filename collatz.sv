module collatz( input logic         clk,   // Clock
		input logic 	    go,    // Load value from n; start iterating
		input logic  [31:0] n,     // Start value; only read when go = 1
		output logic [31:0] dout,  // Iteration value: true after go = 1
		output logic 	    done); // True when dout reaches 1

   /* Replace this comment and the code below with your solution */
   always_ff @(posedge clk) begin
      done <= go;
      dout <= n;
   end
   /* Replace this comment and the code above with your solution */

endmodule
