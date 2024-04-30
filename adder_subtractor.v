module adder_subtractor#(parameter n=18)(
input [n-1:0] x,y,
input control,cin,
output [n-1:0]s,
 output cout);

 wire [n-1:0] xored_y;
generate 

genvar i;

for (i=0;i<n;i=i+1) begin

assign xored_y[i]=y[i]^control;
end
endgenerate
n_bit_adder #(.n(n)) A0(
.x(x),
.y(xored_y),
.cinn(cin),
.c_out(cout),
.s(s)
);
endmodule 
