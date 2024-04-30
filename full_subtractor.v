module full_subtractor(input a, b, b_in, output D, b_out);
  assign D = a ^ b ^ b_in;
  assign b_out = (~a & b) | (~(a ^ b) & b_in);
endmodule
