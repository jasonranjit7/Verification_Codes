class monitor;
  
  mailbox #(transaction) mon2scb;
  virtual intf vif;
  
  function new(mailbox #(transaction) mon2scb, virtual intf vif);
    this.mon2scb = mon2scb;
    this.vif = vif;
  endfunction
  
  virtual task run();
    repeat(4) #1 begin
      transaction trans;
      trans = new();
      
      //get signals from DUT to monitor
      trans.a = vif.a;
      trans.b = vif.b;
      trans.cin = vif.cin;
      trans.cout = vif.cout;
      trans.sum = vif.sum;
      
      //send to scb
      mon2scb.put(trans);
      
      trans.display_all("Monitor Signals");
    end
  endtask
endclass


