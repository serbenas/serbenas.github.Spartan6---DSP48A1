

module n_bit_adder #(parameter n=4)
 (input [n-1:0]x,y,
  input cinn, 
  output [n-1:0]s,
  output c_out); 

  wire  [n:0]c;
  assign c[0]=cinn;
  assign c_out=c[n];

  generate 

    genvar k;

    for(k=0;k<n;k=k+1)

        begin: stage

        full_adder fn(
        .x1(x[k]),
        .x2(y[k]),
        .cin(c[k]),
        .sf(s[k]),
        .cf(c[k+1]));

    end
  endgenerate
endmodule







/*
module n_bit_adder #(parameter n=6)
(input [n-1:0] x,y,
input cin,
output c_out,
output [n-1:0]s);


// generate to do loop 
wire [n:0] c;

assign c[0]=cin;
assign c_out=c[n];
generate 

genvar k;

for (k=0;k<n;k=k+1)
begin : stage
full_adder a
(.x1(x[k]),
.x2(y[k]),
 .cin(c[k]),
.sf(s[k]),
.cf(c[k+1])
);
end
endgenerate
endmodule





*/






