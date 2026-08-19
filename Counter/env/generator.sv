`include "transaction.sv"
class generator;
  transaction trans;
  mailbox #(transaction) gen2drv;
  
  function new(mailbox #(transaction) gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  virtual task run();
    repeat(4) begin
      trans=new();
      
      
      a1: assert(trans.randomize())
        else
          $error("randomization failed");
      
      gen2drv.put(trans);
      
      trans.display_in("GEN SIG");
    end
  endtask
      
endclass
