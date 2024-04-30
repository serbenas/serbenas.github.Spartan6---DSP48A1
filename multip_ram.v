module multip_ram(
  input [17:0] a,
  input [17:0] b,
  output reg [35:0] p);

  always @ (*)
    begin
     p =a * b;
  end

endmodule