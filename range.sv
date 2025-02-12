module range
   #(parameter
     RAM_WORDS = 16,            // Number of counts to store in RAM
     RAM_ADDR_BITS = 4)         // Number of RAM address bits
   (input logic         clk,    // Clock
    input logic 	go,     // Read start and start testing
    input logic [31:0] 	start,  // Number to start from or count to read
    output logic 	done,   // True once memory is filled
    output logic [15:0] count); // Iteration count once finished

   logic 		cgo;    // "go" for the Collatz iterator
   logic                cdone;  // "done" from the Collatz iterator
   logic [31:0] 	n;      // number to start the Collatz iterator

// verilator lint_off PINCONNECTEMPTY
   
   // Instantiate the Collatz iterator
   collatz c1(.clk(clk),
	      .go(cgo),
	      .n(n),
	      .done(cdone),
	      .dout());

   logic [RAM_ADDR_BITS - 1:0] 	 num;         // The iteration we are currently on
   logic [RAM_ADDR_BITS - 1:0] 	 addrSet;         // The RAM address to write too
   logic 			 running = 0; // True during the iterations
   logic [15:0] running_count;
   /* Replace this comment and the code below with your solution,
      which should generate running, done, cgo, n, num, we, and din */
   
   always_ff @(posedge clk) begin
      if (go) begin
         running <= 1;
         done <= 0;
         running_count <= 0;
         we <= 0;
         num <= 0;
         cgo <= 1;
         n <= start;
      end
      else if (running == 1) begin
         cgo <= 0;
         we <= 0;
         if (num == 0 && we == 1) begin
               done <= 1;
               running <= 0;
            end
         if (cdone == 1 && cgo != 1) begin
            
               n <= 32'b1 + start + {{32-RAM_ADDR_BITS{1'b0}}, num};
               cgo <= 1;
               addrSet <= num;
               num <= num + {{RAM_ADDR_BITS-1{1'b0}}, 1'b1};
               din <= running_count;
               running_count <= 0;
               we <= 1;
         end
         else begin
            running_count <= running_count + 16'b1;
         end
      end
      else begin
         done <= 0;
      end
      
   end


   /* Replace this comment and the code above with your solution */

   logic 			 we;                    // Write din to addr
   logic [15:0] 		 din;                   // Data to write
   logic [15:0] 		 mem[RAM_WORDS - 1:0];  // The RAM itself
   logic [RAM_ADDR_BITS - 1:0] 	 addr;                  // Address to read/write

   assign addr = we ? addrSet : start[RAM_ADDR_BITS-1:0];
   
   always_ff @(posedge clk) begin
      if (we) mem[addr] <= din;
      count <= mem[addr];      
   end

endmodule
	     
