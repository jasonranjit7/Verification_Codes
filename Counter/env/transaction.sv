class transaction;
  
  rand bit load;
  rand bit enable;
  rand bit rst;
  rand bit [3:0] count_val; 
  
  bit [3:0] count;
  
  constraint c1{
    enable -> !load;
  }
  
  constraint c2{
    enable dist {0:=20,1:=80};
  }
  
  constraint c3{
    rst dist {1:=20,0:=80};
  }
  
  function void display_in(string name);
    $display(name);
    $display("load = %b, enable = %b, rst = %b, count_val = %b", load,enable,rst, count_val);
  endfunction
    
    function void display_all(string name);
    $display(name);
    $display("load = %b, enable = %b, rst = %b, count = %b, count_val = %b", load,enable,rst,count, count_val);
  endfunction
  
endclass
