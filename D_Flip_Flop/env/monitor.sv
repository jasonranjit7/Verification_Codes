class monitor;
  
  transaction trans;
  virtual intf vif;
  
  mailbox #(transaction) mon2scb;
  
  function new(virtual intf vif, mailbox #(transaction) mon2scb);
    this.vif = vif;
    this.mon2scb = mon2scb;
  endfunction
  
  virtual task run();
    repeat(5) begin
      @(vif.cb);
      trans = new();
      #1
      
      trans.d = vif.d;
      trans.q = vif.cb.q;
      
      mon2scb.put(trans);
      
      trans.display_all("MONITOR SIGNALS");
      
    end
  endtask
endclass
      
      
