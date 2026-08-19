`include "../interfaces/interface.sv"
`include "../test/test.sv"
module tb_top();
  
  
  //clk gen
  bit clk; 
  bit rst;
  initial begin 
    clk = 0;
    forever #5 clk = ~clk;
  end
  
  intf intff(clk,rst);
  test t(intff);
  
  dff DUT(.d(intff.d),
          .clk(intff.clk),
          .rst(intff.rst),
          .q(intff.q)
         );
  
  initial begin
    rst = 1;
    @(negedge intff.clk);
    rst = 0;
    $dumpfile("image.vcd");
    $dumpvars(0);
    #2000
    $finish();
  end
endmodule
          
