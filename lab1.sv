// CSEE 4840 Lab 1: Run and Display Collatz Conjecture Iteration Counts
//
// Spring 2025
//
// By:  Isaac Trost, Robbie Pendergrast, Moises Mata
// Uni: <your uni here>

module lab1( input logic        CLOCK_50,  // 50 MHz Clock input
	     
	     input logic [3:0] 	KEY, // Pushbuttons; KEY[0] is rightmost

	     input logic [9:0] 	SW, // Switches; SW[0] is rightmost

	     // 7-segment LED displays; HEX0 is rightmost
	     output logic [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,

	     output logic [9:0] LEDR // LEDs above the switches; LED[0] on right
	     );

   logic 			clk, go, done;   
   logic [31:0] 		start;
   logic [15:0] 		count;

   logic [11:0] 		n;
   
   assign clk = CLOCK_50;
 
   range #(256, 8) // RAM_WORDS = 256, RAM_ADDR_BITS = 8)
         r ( .* ); // Connect everything with matching names
   
   hex7seg seg5 (n[11:8],HEX5);
   hex7seg seg4 (n[7:4],HEX4);
   hex7seg seg3 (n[3:0],HEX3);

   hex7seg seg2 (count[11:8],HEX2);
   hex7seg seg1 (count[7:4],HEX1);
   hex7seg seg0 (count[3:0],HEX0);

   logic [21:0] but_counter;
   logic reading;
   always_ff @(posedge clk) begin
	   LEDR <= SW;
	   if (KEY[3] == 0) begin
		   start <= {22'b0, SW};
		   go <= 1;
		   n <= 0;
		   but_counter <= 0;
		   reading <= 0;
	   end
	   else begin
		   go <= 0;
		   if (reading == 0) begin
		   	if (done == 1) begin
			   reading <= 1;
		   	end
	   	   end
		   else begin
			   start <= {20'b0, n};
			   if (KEY[0] == 0) begin
				   if (but_counter == 0) begin
				   	n <= n + 12'b1;
			   	   end
				   but_counter <= but_counter + 12'b1;
			   end
			   else if (KEY[1] == 0) begin
				   if (but_counter == 0) begin
				   	n <= n - 12'b1;
			   	   end
				   but_counter <= but_counter + 12'b1;
			   end
			   else begin
				   but_counter <= 0;
			   end
			   if (KEY[2] == 0) begin
				   n <= {2'b0, SW};
			   end
		   end
	   end
   end
  
endmodule
