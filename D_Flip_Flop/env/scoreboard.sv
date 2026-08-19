class scoreboard;
  transaction trans;
  mailbox #(transaction) mon2scb;
  bit expected_q;
  
  function new(mailbox #(transaction) mon2scb);
    this.mon2scb = mon2scb;
  endfunction
  
  virtual task run();
    repeat(5) begin
      mon2scb.get(trans);
      
      //trans.display_all("SCOREBOARD SIGNALS");
      
      //selfchecker
      if(!trans.rst) begin
        if(trans.q == expected_q) begin
          $display("PASSED");
          $display("trans.q = %b, expected_q = %b", trans.q, expected_q);
        end
        else
          $error("FAILED");
      end
      else begin
        if(trans.q == 0)
          $display("PASSED");
      	else
          $error("FAILED");
      end
      
      //$display("expected_q before = %b",expected_q);
      expected_q = trans.d;
      //$display("expected_q after = %b", expected_q);
      
    end
  endtask
endclass
      
      
