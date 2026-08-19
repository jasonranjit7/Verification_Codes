interface intf(input logic clk, input logic rst);
  logic d;
  logic q;
  
  clocking cb @(posedge clk);
    default input #1step output #1ns;
    output d;
    input q;
  endclocking
  
endinterface
