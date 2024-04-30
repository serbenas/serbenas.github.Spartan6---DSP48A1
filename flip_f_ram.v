module flip_f_ram  #( parameter rst_type =1 )  
(
input d,clk,rst,
output reg q
);
 generate
    if (rst_type)begin
        always@(posedge clk or posedge rst)begin
          if(rst)
           q='b0;
          else
           q=d;
        end
     end
    else begin
        always@(posedge clk )begin
         if(rst)
          q='b0;
         else
          q=d;
        end
      end
 endgenerate
endmodule