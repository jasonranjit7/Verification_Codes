class driver;
  transaction trans;
  virtual intf vif;
  mailbox #(transaction) gen2drv;
  
  function new(mailbox #(transaction) gen2drv, virtual intf vif);
    this.gen2drv = gen2drv;
    this.vif = vif;
  endfunction
  
  virtual task run();
    repeat(5) begin
      gen2drv.get(trans);
      
      vif.cb.d <= trans.d;
      
      #1
      
      trans.display_in("DRIVER SIGNALS");
      
    end
  endtask
endclass
      
      
      
