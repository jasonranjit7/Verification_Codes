class driver;
  transaction trans;
  virtual intf vif;
  mailbox #(transaction) gen2drv;
  
  function new(mailbox #(transaction) gen2drv, virtual intf vif);
    this.gen2drv = gen2drv;
    this.vif = vif;
  endfunction
  
  virtual task run();
    forever begin
      gen2drv.get(trans);
      
      @(posedge vif.clk);
      
      vif.load<= trans.load;
      vif.enable<= trans.enable;
      vif.count_val <= trans.count_val;
      
      #1
      
      trans.display_in("DRIVER SIGNALS");
      
    end
  endtask
endclass
