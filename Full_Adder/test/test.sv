`include "../env/environment.sv"
`include "../interfaces/interface.sv"
program automatic test(intf intff);
  
  environment env;
  
  initial begin
    env = new(intff);
    env.run();
  end
endprogram
