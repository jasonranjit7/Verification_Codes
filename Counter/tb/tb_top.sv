`include "interfacaes/interface.sv"
`include "test/test.sv"
module testbench();
  
  bit clk;
  bit rst;
  
  initial begin
    clk = 0;
    forever #10 clk = ~clk;
  end
  
  intf intff(clk,rst);
  test t(intff);
  
  counter DUT(.load(intff.load),
              .enable(intff.enable),
              .rst(intff.rst),
              .clk(intff.clk),
              .count_val(intff.count_val),
              .count(intff.count)
             );
  
  initial begin
    rst = 1;
    @(intff.cb);
    rst = 0;
    $dumpfile("image.vcd");
    $dumpvars();
    #200
    $finish();
  end
endmodule
