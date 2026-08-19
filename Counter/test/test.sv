`include "environment.sv"
program automatic test(intf intff);
  
  environment env;
  
  initial begin
    env = new(intff);
    env.run();
  end
endprogram
  
  
