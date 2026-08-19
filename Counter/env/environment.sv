`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
  
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scb;
  
  mailbox #(transaction) gen2drv;
  mailbox #(transaction) mon2scb;
  
  virtual intf vif;
  
  function new(virtual intf vif);
    this.vif = vif;
    
    
    gen2drv = new();
    mon2scb = new();
    
    gen = new(gen2drv);
    drv = new(gen2drv, vif);
    mon = new(vif, mon2scb);
    scb = new(mon2scb);
    
  endfunction
  
  virtual task run();
    fork
      gen.run();
      drv.run();
      mon.run();
      scb.run();
    join
  endtask
  
endclass
  
  
