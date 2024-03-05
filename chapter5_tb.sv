/*-----------------------------------------------------------------*/

/*****Example 5-1 Testbench for Arbiter WITHOUT INTERFACE*****/
// module test (input logic [1:0] grant,
//              output logic [1:0] request,
//              output logic reset,
//              input logic clk);
//   initial begin
//     @(posedge clk)		request <= 2'b01;
//     $display("at %0d: Drove req=01", $time);
//     repeat(2) @(posedge clk);
//     if (grant != 2'b01)
//       $display("at t=%0d: a1: grant != 2'b01", $time);
//     else 
//       $display("at t=%0d: a1: grant = 2'b01", $time);
//     $stop;
//   end
// endmodule : test

/*****Example 5-6 Testbench for Arbiter WITH INTERFACE*****/
// module test (arb_if arbif);
//   initial begin
//     @(posedge arbif.clk);
//     arbif.request <= 2'b01;
//     $display("at %0d: Drove req=01", $time);
//     repeat(2) @(posedge arbif.clk);
//     if (arbif.grant != 2'b01)
//       $display("at t=%0d: a1: grant != 2'b01", $time);
//     else 
//       $display("at t=%0d: a1: grant = 2'b01", $time);
//     $stop;
//   end
// endmodule : test

/*****Example 5-10 TB for Arbiter WITH INTERFACE-MODPORTS*****/
// module test (arb_if.TEST arbif);
//   initial begin
    
//     @(posedge arbif.clk);
//     arbif.request <= 2'b01;
//     $display("at %0d: Drove req=01", $time);
//     repeat(2) @(posedge arbif.clk);
//     if (arbif.grant != 2'b01)
//       $display("at t=%0d: a1: grant != 2'b01", $time);
//     else 
//       $display("at t=%0d: a1: grant = 2'b01", $time);
    
//     @(posedge arbif.clk);
//     arbif.request <= 2'b10;
//     $display("at %0d: Drove req=10", $time);
//     repeat(2) @(posedge arbif.clk);
//     if (arbif.grant != 2'b10)
//       $display("at t=%0d: a1: grant != 2'b10", $time);
//     else 
//       $display("at t=%0d: a1: grant = 2'b10", $time);
//     $stop;
//   end
// endmodule : test

/*****Example 5-15 TB using INTERFACE WITH CLOCKING BLOCK*****/
program automatic test (arb_if.TEST arbif);
  initial begin
    arbif.cb.request <= 2'b01;
    $display("@%0d: Drove req=01", $time);
    repeat (2) @arbif.cb;
    if (arbif.cb.grant != 2'b01)
      $display("@%0d: a1: grant != 2'b01", $time);
    else 
      $display("at t=%0d: a1: grant = 2'b10", $time);
    $stop;
  end
endprogram: test
