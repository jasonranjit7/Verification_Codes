module counter(input logic load,
               input logic enable,
               input logic rst,
               input logic clk,
               input logic [3:0] count_val,
               output logic [3:0] count
              );
  
  always_ff@(posedge clk) begin
    if(rst)
      count<= '0;
    else if(load)
      count<= count_val;
    else if(enable)
      count++;
    else
      count<=count;
  end
  
endmodule
