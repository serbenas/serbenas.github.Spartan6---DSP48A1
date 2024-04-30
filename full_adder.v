module full_adder(
input x1,x2,cin,
output sf,cf);
wire s1,c1,c2;
half_adder M0(x1,x2,c1,s1);
half_adder M1(
.x1(cin),
.x2(s1),
.s(sf),
.c(c2)
);
or a1(cf,c1,c2);
endmodule
