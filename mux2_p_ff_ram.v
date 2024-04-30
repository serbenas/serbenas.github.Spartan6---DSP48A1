module mux2_p_ff_ram(
  input [47:0]d,
  input rst,clk,
  output [47:0] y,
  wire q);

  mux2_ram_p #(.a(1))   
               u1 (.d0(q),.d1(d), .y(y)); 

  flip_f_ram #(.rst_type(1))   
               u2 (.clk(clk), .rst(rst), .d(d), .q(q)); 
endmodule