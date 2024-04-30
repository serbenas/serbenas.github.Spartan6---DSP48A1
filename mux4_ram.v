module mux4_ram(d0,d1,d2,d3,s0,y);
 input [47:0]d0,d1,d2;
 input d3;
 input [1:0]s0;
 output reg [47:0]y;

 always@(*)begin

    if(s0==='b00)
        y=d0;
    if(s0==='b01)
        y=d1;
    if(s0==='b10)
        y=d2;
    if(s0==='b11)
        y=d3;
 end

endmodule