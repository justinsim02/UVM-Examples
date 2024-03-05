/*-----------------------------------------------------------------*/
/* Justin Sim
	3/1/2024
	Chapter 5 covers techniques for connecting testbench w/ design 
		Topics covered: interface, modport, clocking blocks,
        				timing synchronization, */
/*-----------------------------------------------------------------*/

/*****Example 5-1 Arbiter Model WITHOUT INTERFACE*****/
// module arb_port (output logic [1:0] grant,
//                  input logic [1:0] request,
//                  input logic reset,
//                  input logic clk);
//   always @(posedge clk or posedge reset) begin
//     if (reset)
//       grant <= 2'b00;
//     else 
//       grant <= request;
//   end
// endmodule : arb_port

/*****Example 5-3 Top-level netlist WITHOUT INTERFACE*****/
// module top;
//   logic [1:0] grant, request;
//   logic clk = 0, reset;
//   always #5 clk = ~clk;
  
//   arb_port a1 (.*);
//   test 	   t1 (.*);
// endmodule : top

/*-----------------------------------------------------------------*/

/*****Example 5-4 Simple interface for arbiter*****/
// interface arb_if(input bit clk);
//   logic [1:0] grant, request;
//   logic reset;
// endinterface


// /*****Example 5-5 Top-level netlist WITH INTERFACE*****/
// module top;
//   bit clk;
//   always #5 clk = ~clk;
  
//   arb_if arbif(clk);
//   arb_port a1 (arbif);
//   test t1(arbif);
// endmodule: top

/*****Example 5-7 Arbiter DUT WITH INTERFACE*****/
// module arb_port (arb_if arbif);
//   always @(posedge arbif.clk or posedge arbif.reset)
//     begin
//       if (arbif.reset)
//         arbif.grant <= 2'b00;
//       else
//         arbif.grant <= arbif.request;
//     end
// endmodule : arb_port

/*-----------------------------------------------------------------*/

/*****Example 5-9 Interface WITH MODPORTS*****/
// interface arb_if(input bit clk);
//   logic [1:0] grant, request;
//   logic reset;
  
//   modport TEST (output request, reset,
//                 input grant, clk);
//   modport DUT (input request, reset, clk,
//                output grant);
//   modport MONITOR (input request, grant, reset, clk);
// endinterface
/*****Example 5-13 Interface WITH CLOCKING BLOCK*****/
interface arb_if(input bit clk);
  logic [1:0] grant, request;
  logic reset;
  
  clocking cb @(posedge clk);	// Declare cb
    output request;
    input grant;
  endclocking
  
  modport TEST (clocking cb, 
    			output reset); 	// Use cb
  
  modport DUT (input request, reset, clk,
               output grant);
  modport MONITOR (input request, grant, reset, clk);
endinterface

/*****Example 5-10 Arbriter DUT WITH INTERFACE-MODPORTS*****/
module arb (arb_if.DUT arbif);
  always @(posedge arbif.clk or posedge arbif.reset)
    begin
      if (arbif.reset)
        arbif.grant <= 2'b00;
      else
        arbif.grant <= arbif.request;
    end
endmodule : arb

/*****Example 5-12 Monitor Module with INTERFACE-MODPORTS*****/
module monitor (arb_if.MONITOR arbif);
  always @(posedge arbif.request[0]) begin
    $display("at t=%0d: request[0] asserted", $time);
    @(posedge arbif.grant[0]);
    $display("at t=%0d: grant[0] asserted", $time);
  end
  
  always @(posedge arbif.request[1]) begin
    $display("@%0d: request[1] asserted", $time);
    @(posedge arbif.grant[1]);
    $display("@%0d: grant[1] asserted", $time);
  end
endmodule 

/*****Top-level netlist WITH INTERFACE-MODPORTS*****/
module top;
  bit clk;
  always #5 clk = ~clk;
  
  arb_if arbif(clk);
  arb a1 (arbif);
  test t1(arbif);
  monitor m1 (arbif);
endmodule: top
