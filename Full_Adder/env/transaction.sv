class transaction;
  
  rand bit a;
  rand bit b;
  rand bit cin;
  
  bit cout;
  bit sum;
  
  function void display(string name);
    $display(name);
    $display("a = %b, b = %b, cin = %b",a,b,cin);
  endfunction
  
  function void display_all(string name);
    $display(name);
    $display("a = %b, b = %b, cin = %b, cout = %b, sum = %b",a,b,cin,cout,sum);
  endfunction
  
  constraint equal {
    a == b;
  }
  
  constraint one {
    a inside {1};
  }
  
  //checking randomization fail
  constraint zero {
    b inside {0};
  }
  
endclass
