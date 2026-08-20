`include "transaction.sv"
class generator;
   
  mailbox #(transaction) gen2drv;
  
  //constructor
  function new(mailbox #(transaction) gen2drv);
    this.gen2drv = gen2drv;
  endfunction
  
  virtual task run();
    
    transaction trans;
    repeat(4)
      begin
        trans = new();
        //trans.one.constraint_mode(0);
        trans.constraint_mode(1);
        //trans.one.constraint_mode(1);
        RANDOMISE: assert(trans.randomize())
          else
            $fatal("");
        trans.display("generated signals");
        gen2drv.put(trans);
      end
  endtask
endclass
