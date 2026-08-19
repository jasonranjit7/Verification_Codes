class scoreboard;
  
  transaction trans;
  mailbox #(transaction) mon2scb;
  local bit [3:0] expected_count;
  
  function new(mailbox #(transaction) mon2scb);
    this.mon2scb = mon2scb;
    this.expected_count = '0;
  endfunction
  
  virtual task run();
    forever begin
      
      mon2scb.get(trans);
      
      if(trans.rst)
        expected_count = 0;
      else if(trans.load)
        expected_count = trans.count_val;
      else if(trans.enable)
        expected_count++;
      
      if(trans.count == expected_count)
        $display("----PASS-----");
      else
        $display("-----FAIL----");
      
      trans.display_all("SCOREBOARD");
      end
  endtask
endclass
      
