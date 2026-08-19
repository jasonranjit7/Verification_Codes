class monitor;
  transaction trans;
  mailbox #(transaction) mon2scb;
  virtual intf vif;
  
  function new(virtual intf vif, mailbox #(transaction) mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  virtual task run();
    forever begin
      
      trans = new();
      
      @(posedge vif.clk);
      
      trans.load = vif.load;
      trans.enable = vif.enable;
      trans.count_val = vif.count_val;
      trans.count = vif.count;
      
      mon2scb.put(trans);
      
      trans.display_all("MONITOR SIGNALS");
      
    end
  endtask
endclass
     
