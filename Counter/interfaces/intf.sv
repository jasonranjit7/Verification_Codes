interface intf(input logic clk,input logic rst);
  
  logic load, enable;
  logic [3:0] count, count_val;
  
  clocking cb @(posedge clk);
    default input #1step output #1ns;
    output load;
    output enable;
    output count_val;
    input count;
  endclocking
  
endinterface
