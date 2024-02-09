module d_flip_flop (
  input wire clk,    
  input wire rst,    
  input wire d,      
  output reg q       
);

  always @(posedge clk or posedge rst) begin
    if (rst)         
      q <= 1'b0;
    else            
      q <= d;
  end

endmodule


module tb_d_flip_flop;
  reg clk, rst, d;
  wire q;

  d_flip_flop my_flip_flop (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
  );
  always #5 clk = ~clk;

  initial begin
    clk = 0;
    rst = 1;
    d = 0;

    #10 rst = 0;

    #10 d = 1;
    #10 d = 0;
    #100 $finish; 
  end

endmodule
