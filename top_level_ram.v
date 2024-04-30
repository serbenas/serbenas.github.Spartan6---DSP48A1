module top_level_ram(
//inputs
  input [17:0]a,b,d,
  input [47:0]c,
  input [7:0]opmode,
  input CARRY_IN,
  input CEA,CEB,CEM,CEP,CEC,CED,CECARRY_IN,CEOPMODE,
  input [47:0]PCIN,
  input [17:0] BCIN,
  input RSTA,RSTB,RSTM,RSTP,RSTC,RSTD,RSTCARRY_IN,RSTOPMODE,
  input d3,
  
//outputs
  output  [17:0]BCOUT,
  output  [47:0]PCOUT,
  output  [47:0]P,
  output [35:0]M,
  output  CARRY_OUT,
  output  CARRY_OUTF);
  
//internal signals
  wire [17:0]out_f_d,out_f_a,q_a,q_b,q_d,out_f_b,b1,q_c;
  wire [47:0]out_f_c;
  wire [1:0] out_op1,q_op1,out_op2,q_op2;
  wire out_op4,q_op4,out_op5,q_op5,out_op6,q_op6,out_op7,q_op7,mux_prm_ws,q_m_9_w,q_m_10_w,q_m_8_w,CIN,carry_post_w,mux_prm_w;
  wire [17:0] s_ad_1,muxadb_w,q_m_5_w,q_m_6_w,multi1_w,BCOUT_W;
  wire [35:0] mult_out_w,q_m_7_w,M_bar;
  wire [53:0] ads_2_inp_1_w,s_ad_2;
  wire [47:0] ads_2_inp_2_w;

  assign d3=0;
  assign M=~M_bar;
  assign BCOUT=BCOUT_W;
  assign CARRY_OUTF=CARRY_OUT;
  assign PCOUT=P;
 
//***************************stage_1***************************//
 mux2_p_ff_ram   
                md1 (.d(d),.clk(CED),.rst(RSTD),.y(out_f_d),.q(q_d)); 
 mux2_p_ff_ram   
                ma1 (.d(a),.clk(CEA),.rst(RSTA),.y(out_f_a),.q(q_a)); 
 mux2_p_ff_ram   
                mc1 (.d(c),.clk(CEC),.rst(RSTC),.y(out_f_c),.q(q_c)); 

 mux2_ram_p  #(.a(1))   
                mb1 (.d0(b),.d1(BCIN), .y(b1));
 mux2_p_ff_ram   
                mb2 (.d(b1),.clk(CEB),.rst(RSTB),.y(out_f_b),.q(q_b)); 

//***************************stage_2***************************//

 mux2_p_ff_ram   
                mop1 (.d(opmode[1:0]),.clk(CEOPMODE),.rst(RSTOPMODE),.y(out_op1),.q(q_op1)); 
 mux2_p_ff_ram   
                mop2 (.d(opmode[3:2]),.clk(CEOPMODE),.rst(RSTOPMODE),.y(out_op2),.q(q_op2)); 
 mux2_p_ff_ram   
                mop3 (.d(opmode[4]),.clk(CEOPMODE),.rst(RSTOPMODE),.y(out_op4),.q(q_op4)); 

 mux2_p_ff_ram   
                mop4 (.d(opmode[5]),.clk(CEOPMODE),.rst(RSTOPMODE),.y(out_op5),.q(q_op5));
 mux2_p_ff_ram   
                mop5 (.d(opmode[6]),.clk(CEOPMODE),.rst(RSTOPMODE),.y(out_op6),.q(q_op6)); 
 mux2_p_ff_ram   
                mop6 (.d(opmode[7]),.clk(CEOPMODE),.rst(RSTOPMODE),.y(out_op7),.q(q_op7));
				

//***************************stage_3***************************//


 adder_subtractor #(.n(18))
 
                ads1(.control(opmode[6]),.x(out_f_d),.y(out_f_b),.cin(0),.s(s_ad_1),.cout(d3)); 
				
 mux2_ram
                ads_1_out(.d0(s_ad_1),.d1(out_f_b),.s0(opmode[4]),.y(muxadb_w));


 mux2_p_ff_ram   
                m_5 (.d(muxadb_w),.clk(CEB),.rst(RSTB),.y(BCOUT_W),.q(q_m_5_w)); 
				
 mux2_p_ff_ram   
                m_6 (.d(out_f_a),.clk(CEA),.rst(RSTA),.y(multi1_w),.q(q_m_6_w)); 


 multip_ram  
              multip1(.a(BCOUT_W),.b(multi1_w),.p(mult_out_w));


 mux2_p_ff_ram   
               m_7 (.d(mult_out_w),.clk(CEM),.rst(RSTM),.y(M_bar),.q(q_m_7_w));
			   

//***************************stage_4***************************//

 mux4_ram
               mux_x(.d0({out_f_d,BCOUT,multi1_w}),.d1(PCOUT),.d2({'b0,M_bar}),.d3(0),.s0(opmode[1:0]),.y(ads_2_inp_1_w));


 mux4_ram
               mux_z(.d0(out_f_c),.d1(PCOUT),.d2(PCIN),.d3(0),.s0(opmode[3:2]),.y(ads_2_inp_2_w));



//***************************stage_5***************************//

 adder_subtractor #(.n(48))  

               ads2(.control(opmode[7]),.x(ads_2_inp_1_w),.y(ads_2_inp_2_w),.cin(CIN),.s(s_ad_2),.cout(carry_post_w)); 

 mux2_ram_p #(.a(1)) 
               mux_ads_2_inp (.d0(opmode[5]),.d1(CARRY_IN),.y(mux_prm_w));

 mux2_p_ff_ram   
               m_ads2_inp (.d(mux_prm_w),.clk(CECARRY_IN),.rst(RSTCARRY_IN),.y(CIN),.q(q_m_9_w));

 mux2_p_ff_ram   
               m_ads2_outp (.d(carry_post_w),.clk(CECARRY_IN),.rst(RSTCARRY_IN),.y(CARRY_OUT),.q(q_m_10_w));


//***************************stage_6***************************//

 mux2_p_ff_ram   
               m_8 (.d(s_ad_2),.clk(CEP),.rst(RSTP),.y(P),.q(q_m_8_w));
endmodule