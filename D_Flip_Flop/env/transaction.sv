class transaction;
  
  rand bit d;
  rand bit rst;
  
  bit q;
  
  function void display_in(string name);
    $display(name);
    $display("d = %b, rst = %b",d,rst);
  endfunction
  
  
  function void display_all(string name);
    $display(name);
    $display("d = %b, rst = %b,q = %b",d,rst,q);
  endfunction
  
endclass
