class scoreboard;
  
  mailbox #(transaction) mon2scb;
  
  function new(mailbox #(transaction) mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  virtual task run();
    transaction trans;
    
    repeat(4) begin
      mon2scb.get(trans);
      trans.display_all("scb signals");
      
      
      //golden model
      if( (trans.a^trans.b^trans.cin == trans.sum) &&
         ((trans.a&trans.b)||(trans.b&&trans.cin)||(trans.cin&&trans.a) == trans.cout))
        $display("PASS");
      else
        $display("FAIL");
    end
  endtask
endclass
    
    
