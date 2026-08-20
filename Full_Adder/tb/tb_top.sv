`include "../test/test.sv"
module testbench();
   
  intf intff();
  test tst(intff);
  
  full_adder DUT(.a(intff.a),
                 .b(intff.b),
                 .cin(intff.cin),
                 .sum(intff.sum),
                 .cout(intff.cout)
                );
  
  initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0);
  end
endmodule

