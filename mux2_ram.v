module mux2_ram(d0,d1,s0,y);
   input [17:0]d0,d1;
   input s0;
   output [17:0]y;
   
   assign y=(s0)?d1:d0;
endmodule