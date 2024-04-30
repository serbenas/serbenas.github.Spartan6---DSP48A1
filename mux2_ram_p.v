module mux2_ram_p #(parameter a=1)
    (input [47:0]d0,d1, output  [47:0]y);
	 
	 
     assign y=(a)?d1:d0;
endmodule