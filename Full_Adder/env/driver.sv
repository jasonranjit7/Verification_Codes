class driver;
  
  virtual intf vif;
  
  mailbox #(transaction) gen2drv;
  
  function new(virtual intf vif, mailbox #(transaction) gen2drv);
    this.gen2drv = gen2drv;
    this.vif = vif;
  endfunction
  
  virtual task run();
    repeat(4) begin
      transaction trans;
      gen2drv.get(trans);
      
      vif.a<=trans.a;
      vif.b<=trans.b;
      vif.cin<= trans.cin;
      
      #1;
      
      trans.display("driver signals");
    end
  endtask
endclass
    
    
