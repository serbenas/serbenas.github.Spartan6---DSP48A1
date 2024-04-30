module half_adder(input x1,x2,output c,s);

  xor a1(s,x1,x2);
  and a2(c,x1,x2);

  endmodule 
